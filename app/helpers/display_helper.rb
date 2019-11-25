module DisplayHelper
  include Orchid::DisplayHelper

  # TODO this is a temporary override of the orchid method
  # and can be removed once https://github.com/CDRH/orchid/pull/173
  # becomes part of a release
  def metadata(res, label, api_field, link: true, separator: " | ")
    data = metadata_get_field_values(res, api_field)
    if data.present?
      html = metadata_label(label, length: data.length)
      # iterate through the field values
      dataArray = data.map do |item|
        if link
          metadata_create_field_link(api_field, item)
        else
          value_label(api_field, item)
        end
      end
      html << dataArray
                .map { |i| "<span>#{i}</span>" }
                .join(separator)

      sanitize html
    end
  end

end
