class LearnController < ApplicationController
  before_action :include_assets

  def index
    @title = t "learn.home.title"
  end

  def lesson01
    @xmas = get_item("shan.P067")
    @tv = get_item("shan.P076")
    @stamps = get_item("shan.M010")
    @letter = get_item("shan.L094")

    @title = t "learn.lesson01.title"
  end

  def lesson02
    @wed1 = get_item("shan.P128")
    @wed2 = get_item("shan.P036")
    @wed3 = get_item("shan.P033")
    @letter = get_item("shan.L218")

    @title = t "learn.lesson02.title"
  end

  def lesson03
    @rosary = get_item("shan.M001")
    @card = get_item("shan.D008")
    @let1 = get_item("shan.L198")
    @let2 = get_item("shan.L196")

    @title = t "learn.lesson03.title"
  end

  def lesson04
    @workers = get_item("shan.P119")
    @chickens = get_item("shan.P103")
    @let1 = get_item("shan.L156")
    @let2 = get_item("shan.L002")

    @title = t "learn.lesson04.title"
  end

  def lesson05
    @const = get_item("shan.D005")
    @const_image = "shan_d.103.jpg"

    @title = t "learn.lesson05.title"
  end

  private

  def get_item(id)
    item = {}
    item["res"] = $api.get_item_by_id(id).first
    if item["res"] && item["res"]["uri_html"]
      url = item["res"]["uri_html"]
      item["html"] = Net::HTTP.get(URI.parse(url)) if url
    end
    item
  end

  def include_assets
    @ext_css = helpers.add_assets(@ext_css, "learn")
  end

end
