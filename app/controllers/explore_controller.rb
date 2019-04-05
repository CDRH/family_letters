class ExploreController < ApplicationController

  # TODO remove this once we are actually pulling specific
  # queries for each action instead of a placeholder
  before_action :load_query

  def index
  end

  def exhibit_02
  end

  private

  def load_query
    @res = $api.query({"q" => "water", "num" => "5"})
  end

end
