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
      "language" => {
        "label" => "Language",
        "display" => true
      },
      "subcategory" => {
        "label" => "Type",
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
        "label" => "Place",
        "display" => true
      },
    },
    # add fields for other languages with their language code
    "es" => {
      "category" => {
        "label" => "Categoría",
        "display" => true,
        "translate" => true
      },
      "date.year" => {
        "label" => "Año",
        "display" => true
      },
      "person.name" => {
        "label" => "Persona",
        "display" => true
      },
      "language" => {
        "label" => "Idioma",
        "display" => true
      },
      "subcategory" => {
        "label" => "Tipo",
        "display" => true,
        "translate" => true
      },
      "creator.name" => {
        "label" => "Autor",
        "display" => true,
      },
      "format" => {
        "label" => "Formato",
        "display" => true,
        "translate" => true,
      },
      "places" => {
        "label" => "Lugar",
        "display" => true
      }
    }
  }

end
