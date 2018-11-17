# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_17_224311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "shares", force: :cascade do |t|
    t.integer "wish_list_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wish_list_id", "user_id"], name: "index_shares_on_wish_list_id_and_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.string "session_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id", "username"], name: "index_users_on_id_and_username", unique: true
  end

  create_table "wish_lists", force: :cascade do |t|
    t.string "name", null: false
    t.integer "user_id"
    t.boolean "is_public", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wish_lists_on_user_id"
  end

  create_table "wishes", force: :cascade do |t|
    t.string "name", null: false
    t.integer "granter_id"
    t.integer "wish_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wish_list_id", "granter_id"], name: "index_wishes_on_wish_list_id_and_granter_id"
  end

end
