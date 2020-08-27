module ResearchHelper

  def decade_active(item)
    "active " if params["id"] == item.to_s
  end

  def place_active(place, type)
    # if no parameter for type, assume this is origin
    param_type = params["type"] || "origin"
    if params["id"] == place && param_type == type
      "active "
    end
  end

end
