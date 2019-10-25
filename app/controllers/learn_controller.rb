class LearnController < ApplicationController
  before_action :include_assets

  private

  def include_assets
    @ext_css = helpers.add_assets(@ext_css, "learn")
  end
end
