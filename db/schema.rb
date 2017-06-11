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

ActiveRecord::Schema.define(version: 20170521222655) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "champions", force: :cascade do |t|
    t.string   "name"
    t.string   "portrait"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "counters", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "champion_id"
    t.integer  "counters_id"
    t.integer  "user_id"
    t.index ["champion_id"], name: "index_counters_on_champion_id", using: :btree
    t.index ["user_id"], name: "index_counters_on_user_id", using: :btree
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "roster_id"
    t.index ["roster_id"], name: "index_positions_on_roster_id", using: :btree
  end

  create_table "rosters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_rosters_on_user_id", using: :btree
  end

  create_table "strengths", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "champion_id"
    t.integer  "user_id"
    t.index ["champion_id"], name: "index_strengths_on_champion_id", using: :btree
    t.index ["user_id"], name: "index_strengths_on_user_id", using: :btree
  end

  create_table "synergies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "champion_id"
    t.integer  "synergizes_with_id"
    t.integer  "user_id"
    t.index ["champion_id"], name: "index_synergies_on_champion_id", using: :btree
    t.index ["user_id"], name: "index_synergies_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "player_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "roster_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["roster_id"], name: "index_users_on_roster_id", using: :btree
  end

  create_table "weaknesses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "champion_id"
    t.integer  "user_id"
    t.index ["champion_id"], name: "index_weaknesses_on_champion_id", using: :btree
    t.index ["user_id"], name: "index_weaknesses_on_user_id", using: :btree
  end

  add_foreign_key "counters", "champions"
  add_foreign_key "counters", "users"
  add_foreign_key "positions", "rosters"
  add_foreign_key "rosters", "users"
  add_foreign_key "strengths", "champions"
  add_foreign_key "strengths", "users"
  add_foreign_key "synergies", "champions"
  add_foreign_key "synergies", "users"
  add_foreign_key "users", "rosters"
  add_foreign_key "weaknesses", "champions"
  add_foreign_key "weaknesses", "users"
end
