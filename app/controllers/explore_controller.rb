class ExploreController < ApplicationController

  # TODO remove this once we are actually pulling specific
  # queries for each action instead of a placeholder
  before_action :load_query

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

  def load_query
    @res = $api.query({"q" => "water", "num" => "5"})
  end

end
