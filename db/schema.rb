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

ActiveRecord::Schema[7.1].define(version: 2025_07_01_171944) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "logo", limit: 500
    t.date "creation_date", null: false
    t.decimal "annual_turnover", precision: 15, scale: 2, null: false
    t.text "location", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_size", default: 1, null: false
    t.string "website_url", limit: 500
    t.text "description"
    t.index ["annual_turnover"], name: "index_agencies_on_annual_turnover"
    t.index ["creation_date"], name: "index_agencies_on_creation_date"
    t.index ["name"], name: "index_agencies_on_name"
    t.check_constraint "team_size > 0", name: "team_size_positive"
  end

  create_table "agency_tags", force: :cascade do |t|
    t.bigint "agency_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id", "tag_id"], name: "index_agency_tags_on_agency_id_and_tag_id", unique: true
    t.index ["agency_id"], name: "index_agency_tags_on_agency_id"
    t.index ["tag_id"], name: "index_agency_tags_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "agency_tags", "agencies"
  add_foreign_key "agency_tags", "tags"
end
