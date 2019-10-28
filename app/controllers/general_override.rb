GeneralController.class_eval do

  def about_acknowledgements
    @title = t "about.acknowledgements.title"
  end

  def about_faq
    @title = t "about.faq.title"
  end

  def about_team
    @title = t "about.team.title"
  end

  def about_technical
    @title = t "about.technical.title"
  end

  # returns a list of all the rails views with content that should be searchable
  def content_pages
    all_routes = Rails.application.routes.routes.map do |route|
      route.path.spec.to_s
    end
    filtered = all_routes.select { |r| r[/explore|learn|research/] }
    # get the current base URL + sub URI if it exists
    base_url = request.base_url
    if config.relative_url_root
      base_url = File.join(base_url, config.relative_url_root)
    end

    urls = filtered.map do |path|
      # family letters only supports en as an alternate language
      # but if this changes we can pull languages from the config file

      # not sending the portuguese format since we don't have a field for
      # supporting portuguese text and the english / spanish versions
      # are already available to be searched

      next if path.include?("objects_pt")

      path.gsub!("(.:format)", "").gsub!("(/:locale)", "")
      # group the urls with different language but same content
      [
        File.join(base_url, path),
        File.join(base_url, "en", path)
      ]
    end
    render json: urls.compact
  end

end
