# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141126081858) do

  create_table "api_keys", force: true do |t|
    t.string   "token"
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_users", force: true do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.string   "cards"
    t.integer  "seat_occcupied_index"
    t.boolean  "is_waiting"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_winner",                                     default: false
    t.decimal  "winner_prize",         precision: 10, scale: 0
  end

  create_table "games", force: true do |t|
    t.integer  "table_id"
    t.string   "round_name"
    t.integer  "current_user_id"
    t.decimal  "pot_value",       precision: 10, scale: 0
    t.text     "deck"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uuid"
  end

  create_table "moves", force: true do |t|
    t.string   "action"
    t.integer  "user_id"
    t.decimal  "remaining_chips", precision: 10, scale: 0
    t.decimal  "bet_amount",      precision: 10, scale: 0
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "board"
    t.string   "round_bets"
    t.string   "round_max_bet"
    t.decimal  "pot",             precision: 10, scale: 0
    t.integer  "next_user_id"
  end

  create_table "rooms", force: true do |t|
    t.string   "name"
    t.decimal  "min_stake",   precision: 10, scale: 0
    t.decimal  "max_stake",   precision: 10, scale: 0
    t.decimal  "min_buy_in",  precision: 10, scale: 0
    t.decimal  "max_buy_in",  precision: 10, scale: 0
    t.integer  "max_players"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "table_config_users", force: true do |t|
    t.integer  "table_config_id"
    t.integer  "user_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "table_configs", force: true do |t|
    t.string   "name"
    t.decimal  "small_blind", precision: 10, scale: 0
    t.decimal  "big_blind",   precision: 10, scale: 0
    t.integer  "min_player"
    t.integer  "max_player"
    t.decimal  "min_buy_in",  precision: 10, scale: 0
    t.decimal  "max_buy_in",  precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "table_users", force: true do |t|
    t.integer  "table_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tables", force: true do |t|
    t.string   "name"
    t.integer  "table_config_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fb_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role",                   default: "PLAYER"
    t.boolean  "is_guest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
