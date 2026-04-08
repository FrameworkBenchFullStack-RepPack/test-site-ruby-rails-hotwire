# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "category", id: :serial, force: :cascade do |t|
    t.string "name", limit: 50, null: false
  end

  create_table "person", id: :serial, force: :cascade do |t|
    t.integer "age", limit: 2, null: false
    t.integer "category_id", null: false
    t.string "name", limit: 100, null: false
  end

  add_foreign_key "person", "category", name: "person_category_id_fkey"
end
