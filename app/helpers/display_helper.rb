module DisplayHelper
  include Orchid::DisplayHelper

  def metadata(res, label, search_ele, link_bool=true)
    data = res[search_ele]
    if data.present?
      html = "<li><strong>#{label}:</strong> "
      data = data.class == Array ? data : [data]
      dataArray = data.map do |item|
        if link_bool
          search_params = { "f" => ["#{search_ele}|#{item}"] }
          item_label = value_label(search_ele, item)
          link_to item_label, search_path(search_params), rel: "nofollow"
        else
          item
        end
      end
      html += dataArray.join(" | ")
      return html.html_safe
    end
  end

end
