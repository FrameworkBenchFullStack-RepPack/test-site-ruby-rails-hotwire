class SortOptions
     DEFAULT = "name"

  OPTIONS = {
    "name" => {
      label: "Name",
      order: ->(query) { query.order(Person.arel_table[:name].asc) }
    },
    "age" => {
      label: "Age",
      order: ->(query) { query.order(Person.arel_table[:age].asc, Person.arel_table[:name].asc) }
    },
    "category" => {
      label: "Category",
      order: ->(query) { query.order(Category.arel_table[:name].asc, Person.arel_table[:name].asc) }
    }
  }.freeze

  def self.select_options
    OPTIONS.map { |key, config| [ config[:label], key ] }
  end
end
