class LearnController < ApplicationController
  before_action :include_assets

  def index
    @title = t "learn.home.title"
  end

  def lesson01
    @title = t "learn.lesson01.title"
    @xmas = get_item("shan_p.135")
    @tv = get_item("shan_p.153")
    @stamps = get_item("shan_m.026")
    @letter = get_item("shan_L094.meta")
  end

  def lesson02
    @title = t "learn.lesson02.title"
  end

  def lesson03
    @title = t "learn.lesson03.title"
  end

  def lesson04
    @title = t "learn.lesson04.title"
  end

  def lesson05
    @title = t "learn.lesson05.title"
  end

  private

  def get_item(id)
    item = {}
    item["res"] = $api.get_item_by_id(id).first
    if item["res"]["uri_html"]
      url = item["res"]["uri_html"]
      item["html"] = Net::HTTP.get(URI.parse(url)) if url
    end
    item
  end

  def include_assets
    @ext_css = helpers.add_assets(@ext_css, "learn")
  end

end
