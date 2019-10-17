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
    @res = @items_api.query(options)

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

end
