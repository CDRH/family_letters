require "open-uri"

class ResearchController < ApplicationController

  def index
    @title = t "research.title"
  end

  def maps
    @title = t "research.maps.title"
  end

  def map
    id = params["id"]
    @title = t "research.maps.#{id}.title"

    # get the geojson from the data repo
    # TODO make configurable

    url = "http://localhost:5000/output/development/geojson/#{id}.json"
    geojson = open(url)
    if geojson.status
      @geojson = geojson.read.force_encoding(Encoding::UTF_8)
    end
  end

end
