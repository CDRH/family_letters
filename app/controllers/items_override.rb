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
    # you only need to search the language if there is a query
    # and if the query is not only using the identifiers
    if options.has_key?("q") && options["q"].present? && !options["q"].include?("identifier:")
      query = options["q"]
      type = params["text_typex"]

      if type == "es" || type == "en"
        options["q"] = "text_t_#{type}:#{query}"
      else
        options["q"] = "(text_t_es:#{query}) OR (text_t_en:#{query})"
      end
    end
  end

end
