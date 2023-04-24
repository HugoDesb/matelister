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

ActiveRecord::Schema[7.0].define(version: 2023_03_25_170150) do
  create_table "invites", force: :cascade do |t|
    t.string "email"
    t.integer "matelist_id", null: false
    t.string "otp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matelist_id"], name: "index_invites_on_matelist_id"
  end

  create_table "matelists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_matelists_on_user_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name"
    t.string "provider"
    t.string "uid"
    t.integer "matelist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matelist_id"], name: "index_playlists_on_matelist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "username"
    t.string "image"
    t.string "nickname"
    t.string "access_token"
    t.boolean "expires"
    t.datetime "expires_at"
    t.string "encrypted_password", default: "", null: false
    t.string "refresh_token"
    t.datetime "remember_created_at"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "invites", "matelists"
  add_foreign_key "matelists", "users"
end
