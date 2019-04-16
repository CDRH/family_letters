class ExploreController < ApplicationController

  def index
    @ext_js = "load_lightbox"
  end

  def exhibit_01
    # TODO this is a placeholder query as an example of content generation
    @res = $api.query({"q" => "water", "num" => "5"})
  end

  def exhibit_02
    @ext_js = "load_lightbox"
  end

  def exhibit_03
    @ext_js = "load_lightbox"
  end

  def exhibit_04
    @ext_js = "load_lightbox"
  end

end
