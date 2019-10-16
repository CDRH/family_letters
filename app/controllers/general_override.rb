GeneralController.class_eval do

  # returns a list of all the rails views with content that should be searchable
  def content_pages
    all_routes = Rails.application.routes.routes.map do |route|
      route.path.spec.to_s
    end
    filtered = all_routes.select { |r| r[/explore|research|teach/] }
    # get the current URL and remove this path from it
    # because request.base_url will not accommodate sub-uris
    base_url = request.url.sub("/content_pages", "")
    urls = filtered.map do |path|
      # family letters only supports en as an alternate language
      # but if this changes we can pull languages from the config file
      path.gsub!("(.:format)", "").gsub!("(/:locale)", "")
      # group the urls with different language but same content
      [
        File.join(base_url, path),
        File.join(base_url, "en", path)
      ]
    end
    render json: urls
  end

end
