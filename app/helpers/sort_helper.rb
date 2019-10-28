module SortHelper
  include Orchid::SortHelper

  # override because multi-language sites currently lack
  # ability for on-the-spot translated filter values to
  # be sorted
  def sort_fields_facets
    if @section.present? && respond_to?("#{@section}_sort_fields_facets")
      send "#{@section}_sort_fields_facets"
    else
      {
        "count|desc" => t("search.sort.count_desc", default: "Count (most first)"),
        "count|asc" => t("search.sort.count_asc", default: "Count (least first)"),
      }
    end
  end

  # override the orchid sort fields because the title field changes
  # depending on the language in question
  def sort_fields_search_additional
    # include "grouping" => "separator" to insert separator in dropdown
    f = {}
    f["date|asc"] = t("search.sort.date_asc", default: "Date (earliest first)")
    f["date|desc"] = t("search.sort.date_desc", default: "Date (latest first)")
    f["titles"] = "separator"
    if locale == :en
      f["title_sort|asc"] = t("search.sort.title_asc", default: "Title (A-Z)")
      f["title_sort|desc"] = t("search.sort.title_desc", default: "title (Z-A)")
    else
      # default to spanish if english not specified
      f["title_sort_es_k|asc"] = t("search.sort.title_asc", default: "Title (A-Z)")
      f["title_sort_es_k|desc"] = t("search.sort.title_desc", default: "Title (Z-A)")
    end
    f["creators"] = "separator"
    f["creator.name|asc"] = t("search.sort.creator_asc", default: "Creator (A-Z)")
    f["creator.name|desc"] = t("search.sort.creator_desc", default: "Creator (Z-A)")
    f
  end

end
