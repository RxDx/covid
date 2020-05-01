# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_01_171707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reports", force: :cascade do |t|
    t.string "iso_code"
    t.string "location"
    t.date "date"
    t.integer "total_cases"
    t.integer "new_cases"
    t.integer "total_deaths"
    t.string "new_deaths"
    t.string "integer"
    t.integer "total_cases_per_million"
    t.integer "new_cases_per_million"
    t.integer "total_deaths_per_million"
    t.integer "new_deaths_per_million"
    t.integer "total_tests"
    t.integer "new_tests"
    t.integer "total_tests_per_thousand"
    t.integer "new_tests_per_thousand"
    t.integer "tests_units"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["date"], name: "index_reports_on_date"
    t.index ["iso_code"], name: "index_reports_on_iso_code"
    t.index ["location"], name: "index_reports_on_location"
  end

end
