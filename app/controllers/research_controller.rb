require "open-uri"

class ResearchController < ApplicationController

  def index
    @title = t "research.title"
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
      @title = t "research.maps.decade.title_all"
      @geojson = {
        "routes" => get_json("routes"),
        "destination" => get_json("destination"),
        "origin" => get_json("origin"),
      }
    end
  end

  def map_photographs
    @geojson = get_json("photographs")
    @title = t "research.maps.photos.title"
  end

  def map_place
    place = params["id"]
    type = params["type"].present? ? params["type"] : "origin"

    @title = "#{place}: #{t "research.maps.key.#{type.downcase}"}"
    @geojson = get_json("#{place}_#{type}_routes")
  end

  private

  def get_json(id)
    url = geojson_url(id)
    # TODO set up error handling
    geojson = open(url)
    if geojson.status
      geojson.read.force_encoding(Encoding::UTF_8)
    end
  end

  def geojson_url(id)
    File.join(
      PRIVATE["data_path"],
      "output/development/geojson",
      "#{id}.json"
    )
  end

end
