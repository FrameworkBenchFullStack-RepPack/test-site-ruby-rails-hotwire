class ListFilters
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :sort, :string
  attribute :age_from, :integer
  attribute :age_to, :integer
  attribute :size, :integer
  attribute :page_num, :integer
  attribute :category, default: []

  def self.from_params(request, params, categories, default_size)
    permitted = params.permit(:sort, :age_from, :age_to, :category, :size, :page_num, :commit)

    defaults = ListConfig::FILTER_DEFAULTS
    limits = ListConfig::FILTER_LIMITS

    selected_categories = URI.decode_www_form(request.query_string)
      .select { |key, _| key == "category" }
      .map { |_, value| value }

    new(
      sort: permitted[:sort],
      age_from: parse_int(permitted[:age_from], defaults[:age_from], limits[:age_from]),
      age_to: parse_int(permitted[:age_to], defaults[:age_to], limits[:age_to]),
      category: parse_categories(selected_categories, categories),
      size: parse_int(permitted[:size], default_size, limits[:size]),
      page_num: parse_int(permitted[:page_num], defaults[:page_num], limits[:page_num])
    )
  end

  private

  def self.parse_int(value, default, limits)
    return default unless value.present?

    integer =
      begin
        Integer(value)
      rescue ArgumentError, TypeError
        nil
      end

    return default if integer.nil?

    min = limits[:min]
    max = limits[:max]

    return default if integer < min || integer > max

    integer
  end

  def self.parse_categories(selected, categories)
    default = Array(categories)
      .map do |cat|
        cat.id
      end


    return default unless selected.present?

    ids = Array(selected)
      .map do |value|
        parse_int(value, nil, ListConfig::FILTER_LIMITS[:category])
      end
      .compact
      .uniq

    return default unless !ids.empty?

    ids
  end
end
