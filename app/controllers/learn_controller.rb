class LearnController < ApplicationController
  before_action :include_assets

  def index
    @title = t "learn.home.title"
  end

  def lesson01
    @title = t "learn.lesson01.title"
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

  def include_assets
    @ext_css = helpers.add_assets(@ext_css, "learn")
  end
end
