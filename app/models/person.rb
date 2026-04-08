class Person < ApplicationRecord
  self.table_name = "person"

  belongs_to :category,
             class_name: "Category",
             foreign_key: "category_id"

  def self.filter(filters)
    people = all.left_joins(:category)
    people = people.where(Person.arel_table[:age].gteq(filters.age_from))
    people = people.where(Person.arel_table[:age].lteq(filters.age_to))
    people = people.where(Category.arel_table[:id].in(filters.category))
    sort_function = SortOptions::OPTIONS[filters.sort] || SortOptions::OPTIONS[SortOptions::DEFAULT]
    people = sort_function[:order].call(people)
    people = people.limit(filters.size).offset((filters.page_num - 1) * filters.size)
    people
  end
end
