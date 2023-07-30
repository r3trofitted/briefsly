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

ActiveRecord::Schema[7.0].define(version: 2023_07_30_141748) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jams", force: :cascade do |t|
    t.bigint "slot_id", null: false
    t.bigint "guest_id", null: false
    t.datetime "start_at", null: false
    t.datetime "end_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0, null: false
    t.index ["guest_id"], name: "index_jams_on_guest_id"
    t.index ["slot_id"], name: "index_jams_on_slot_id"
  end

  create_table "slots", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "repository", null: false
    t.integer "issue_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "start_at", null: false
    t.time "end_at", null: false
    t.date "date", null: false
    t.index ["user_id"], name: "index_slots_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "github_uid", null: false
    t.string "github_access_token"
    t.string "github_nickname", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "experience", default: 1, null: false
    t.integer "experience_level"
    t.string "ext_auth_token"
  end

  add_foreign_key "jams", "slots"
  add_foreign_key "jams", "users", column: "guest_id"
  add_foreign_key "slots", "users"
end
