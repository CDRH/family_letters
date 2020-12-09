module ResearchHelper

  def decade_active(item)
    "active " if params["id"] == item.to_s
  end

  def decade_link(decade)
    link_to decade,
      research_map_decade_path(id: decade, anchor: "map_complete_container"),
      class: "btn btn-default btn-sm #{decade_active(decade)}"
  end

  def map_nav(translation, route_path, action)
    active = current_page?(action: action) ? " active" : ""
    link_to t(translation), route_path,
      class: "btn btn-default #{active}"
  end

  def place_active(place, type)
    # if no parameter for type, assume this is origin
    param_type = params["type"] || "origin"
    if params["id"] == place && param_type == type
      "active "
    end
  end

  def place_link_from(place, label=nil)
    label ||= place
    from = t "research.maps.from"
    place_link(place, "#{from} #{label}", origin: true)
  end

  def place_link_to(place, label=nil)
    label ||= place
    to = t "research.maps.to"
    place_link(place, "#{to} #{label}", origin: false)
  end

  def place_link(place, label, origin: true)
    class_active = origin ? "origin" : "destination"
    opts = {
      id: place,
      anchor: "map_complete_container"
    }
    opts[:type] = "destination" if !origin
    link_to label,
      research_map_place_path(opts),
      class: "btn btn-default #{place_active(place, class_active)}"
  end

end
