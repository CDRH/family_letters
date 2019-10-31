class LearnController < ApplicationController
  before_action :include_assets

  def index
    @title = t "learn.home.title"
  end

  def lesson01
    @xmas = get_item("shan_p.135")
    @tv = get_item("shan_p.153")
    @stamps = get_item("shan_m.026")
    @letter = get_item("shan_L094.meta")

    @title = t "learn.lesson01.title"
  end

  def lesson02
    @wed1 = get_item("shan_p.257")
    @wed2 = get_item("shan_p.073")
    @wed3 = get_item("shan_p.067")
    @letter = get_item("shan_L218.meta")

    @title = t "learn.lesson02.title"
  end

  def lesson03
    @rosary = get_item("shan_m.001")
    @card = get_item("shan_d.127")
    @let1 = get_item("shan_L198.meta")
    @let2 = get_item("shan_L196.meta")

    @title = t "learn.lesson03.title"
  end

  def lesson04
    @workers = get_item("shan_p.239")
    @chickens = get_item("shan_p.207")
    @let1 = get_item("shan_L156.meta")
    @let2 = get_item("shan_L002.meta")

    @title = t "learn.lesson04.title"
  end

  def lesson05
    @const = get_item("shan_d.059")
    @const_image = "shan_d.103.jpg"

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
