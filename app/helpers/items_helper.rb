module ItemsHelper
  include Orchid::ItemsHelper

  def search_item_link(item)
    if item["category"] != "Secondary Source"
      # default behavior for majority of items
      prefix_path("item_path", id: item["identifier"])
    else
      # these pages have unique paths that must be constructed
      # from the identifier
      # does not need prefix_path to find the correct language
      send "#{item["identifier"]}_path"
    end
  end

  def title_label(item)
    # if locale is english specifically, use title
    # otherwise always use title_es_k
    untitled = t("search.results.item.no_title", default: "Untitled")
    if locale == :en
      item["title"].present? ? item["title"] : untitled
    else
      item["title_es_k"].present? ? item["title_es_k"] : untitled
    end
  end

end
