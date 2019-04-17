class ExploreController < ApplicationController

  before_action :gallery_lightbox_includes,
    only: [ :index, :exhibit_02, :exhibit_03, :exhibit_04 ]

  def exhibit_01
    # TODO this is a placeholder query as an example of content generation
    @res = $api.query({"q" => "water", "num" => "5"})
  end

  private

  def gallery_lightbox_includes
    @ext_css = %w(ekko-lightbox.min)
    @ext_js = %w(ekko-lightbox.min)
    @inline_js = [
      "$(document).delegate('*[data-toggle=\"lightbox\"]', 'click', function(event) {
        event.preventDefault();
        $(this).ekkoLightbox();
      });"
    ]
  end

end
