module Facets
  extend Orchid::Facets

  Facets.facet_info = {
    "en" => {
      "category" => {
        "label" => "Category",
        "display" => true
      },
      "date.year" => {
        "label" => "Year",
        "display" => true
      },
      "person.name" => {
        "label" => "People",
        "display" => true
      },
      "languages" => {
        "label" => "Language",
        "display" => true
      },
      "subcategory" => {
        "label" => "Subcategory",
        "display" => true
      },
      "creator.name" => {
        "label" => "Creator",
        "display" => true,
      },
      "format" => {
        "label" => "Format",
        "display" => true
      },
      "places" => {
        "label" => "Places",
        "display" => true
      },
    },
    # add fields for other languages with their language code
    "es" => {
      "category" => {
        "label" => "Categoría",
        "display" => true
      },
      "date.year" => {
        "label" => "Año",
        "display" => true
      },
      "person.name" => {
        "label" => "Gente",
        "display" => true
      },
      "languages" => {
        "label" => "Idioma",
        "display" => true
      },
      "subcategory" => {
        "label" => "Subcategoría",
        "display" => true
      },
      "creator.name" => {
        "label" => "Autor",
        "display" => true,
      },
      "format" => {
        "label" => "Formato",
        "display" => true
      },
      "places" => {
        "label" => "Sitio",
        "display" => true
      }
    }
  }

end
