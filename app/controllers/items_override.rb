ItemsController.class_eval do
  before_action :set_page_facets, only: [:browse, :browse_facet, :index, :show]

  def index
    @ext_js = ["orchid/search"]

    if params["sort"].blank? && params["q"].present?
      params["sort"] = ["relevancy|desc"]
    end
    options = params.permit!.deep_dup
    options, @from, @to = helpers.date_filter(options)

    # index method the same as orchid except for addition of this line
    search_language(options)

    @title = t "search.title"

    if params["map"].present?
      fields = %w[
        identifier
        spatial.title
        spatial.type
        spatial.coordinates
        subcategory
        title
        title_es_k
      ]
      options["num"] = 800
      options["fl"] = fields.join(",")
      # TODO restrict query to only photographs / letters
      @res = @items_api.query(options)
      @map = convert_geojson(@res.items)
    else
      @res = @items_api.query(options)
    end
    render_overridable("items", "index")

  end

  def search_language(options)
    if options.has_key?("q") && options["q"].present?
      query = options["q"]
      type = params["text_typex"]

      if type == "es" || type == "en"
        options["q"] = "text_t_#{type}:#{query}"
      else
        options["q"] = "(text_t_es:#{query}) OR (text_t_en:#{query})"
      end
      options
    end
  end

  private

  # expects array of items
  def convert_geojson(api_res)
    features = []
    api_res.each do |item|
      next if !item["spatial"]
      properties = {
        "id" => item["identifier"],
        "item_title" => item["title"],
        "item_title_es" => item["title_es_k"],
        "subcategory" => item["subcategory"]
      }
      feature = {
        "type" => "Feature",
        "properties" => properties,
        "geometry" => geojson_geometry(item["spatial"])
      }
      features << feature
    end
    {
      "type": "FeatureCollection",
      "features": features
    }
  end

  def geojson_geometry(spatial)
    puts "spatial: #{spatial}"
    if spatial.length == 1
      {
        "type" => "Point",
        "coordinates" => [
          spatial.first["coordinates"]["lon"],
          spatial.first["coordinates"]["lat"]
        ]
      }
    else
      puts "looking here for spatial"
      puts spatial
      coords = spatial.map do |s|
        [
          s["coordinates"]["lon"],
          s["coordinates"]["lat"]
        ]
      end
      {
        "type" => "LineString",
        "coordinates" => coords
      }
    end
  end

end
