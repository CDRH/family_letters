require "open-uri"

class ResearchController < ApplicationController

  def index
    @title = t "research.title"
  end

  def maps
    @title = t "research.maps.title"
  end

  def map_decade
    year = params["id"]
    if year.present? && year[/\d{4}/]
      @title = year
      @geojson = {
        "routes" => get_json("#{year}_routes"),
        "destination" => get_json("#{year}_destination"),
        "origin" => get_json("#{year}_origin"),
      }
    else
      @title = t "research.maps.all.title"
      @geojson = {
        "routes" => get_json("routes"),
        "destination" => get_json("destination"),
        "origin" => get_json("origin"),
      }
    end
  end

  private

  def get_json(id)
    # TODO make configurable
    url = "http://localhost:5000/output/development/geojson/#{id}.json"
    # TODO set up error handling
    geojson = open(url)
    if geojson.status
      geojson.read.force_encoding(Encoding::UTF_8)
    end
  end

end
