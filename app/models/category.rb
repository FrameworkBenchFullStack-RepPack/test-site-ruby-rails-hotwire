class Category < ApplicationRecord
  self.table_name = "category"

  has_many :people,
           class_name: "Person",
           foreign_key: "category_id"
end
