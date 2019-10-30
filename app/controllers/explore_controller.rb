class ExploreController < ApplicationController

  before_action :image_gallery,
                only: [:connections, :index, :migrations, :more_than_work]

  def index
    @title = t "explore.title"
  end

  def connections
    @title = t "explore.connections.title"
  end

  def language_and_life
    @title = t "explore.language_and_life.title"
  end

  def migrations
    @title = t "explore.migrations.title"
  end

  def more_than_work
    @title = t "explore.more_than_work.title"
  end

  def objects
    @title = t "explore.objects.title"
  end

  def objects_pt
    @title = t "explore.objects.title"
  end

  private

  def image_gallery
    # enable lightbox functionality
    @ext_js = helpers.add_assets(@ext_js, "image_gallery")
  end

end
