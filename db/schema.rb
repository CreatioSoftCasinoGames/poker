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

ActiveRecord::Schema.define(version: 20150209073911) do

  create_table "api_keys", force: true do |t|
    t.string   "token"
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "economy_bets", force: true do |t|
    t.decimal  "lower_limit", precision: 10, scale: 0
    t.decimal  "upper_limit", precision: 10, scale: 0
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "economy_hands", force: true do |t|
    t.string   "hand_quality"
    t.integer  "winner_point"
    t.integer  "other_winner_point"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "economy_participations", force: true do |t|
    t.decimal  "lower_limit",         precision: 10, scale: 0
    t.decimal  "upper_limit",         precision: 10, scale: 0
    t.integer  "winner_points"
    t.integer  "other_winner_points"
    t.integer  "participation_point"
    t.integer  "stopper"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "economy_ranges", force: true do |t|
    t.decimal  "upper_limit", precision: 10, scale: 0
    t.decimal  "lower_limit", precision: 10, scale: 0
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friend_requests", force: true do |t|
    t.integer "user_id"
    t.integer "requested_to_id"
    t.boolean "confirmed",       default: false
  end

  create_table "friendships", force: true do |t|
    t.integer "user_id"
    t.integer "friend_id"
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
    t.decimal  "hand_rank",            precision: 10, scale: 0
    t.string   "hand_message"
    t.decimal  "remaining_chips",      precision: 10, scale: 0
    t.decimal  "round_chips",          precision: 10, scale: 0
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

  create_table "gift_requests", force: true do |t|
    t.integer  "user_id"
    t.integer  "send_to_id"
    t.string   "gift_type"
    t.boolean  "confirm",      default: false
    t.boolean  "is_requested", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "in_game_gifts", force: true do |t|
    t.string   "name"
    t.decimal  "cost",       precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "login_histories", force: true do |t|
    t.boolean  "active"
    t.integer  "user_id"
    t.string   "login_token"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.decimal  "small_blind",    precision: 10, scale: 0
    t.decimal  "big_blind",      precision: 10, scale: 0
    t.integer  "min_player"
    t.integer  "max_player"
    t.decimal  "min_buy_in",     precision: 10, scale: 0
    t.decimal  "max_buy_in",     precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "game_type"
    t.decimal  "pot",            precision: 10, scale: 0
    t.decimal  "fee",            precision: 10, scale: 0
    t.integer  "shootout_level",                          default: 0
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
    t.string   "email",                                           default: "",       null: false
    t.string   "encrypted_password",                              default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                   default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fb_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role",                                            default: "PLAYER"
    t.boolean  "is_guest"
    t.decimal  "chips",                  precision: 10, scale: 0
    t.decimal  "xp",                     precision: 10, scale: 0, default: 0
    t.decimal  "diamonds",               precision: 10, scale: 0, default: 0
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "device_avatar_id",                                default: 0
    t.decimal  "biggest_pot",            precision: 10, scale: 0, default: 0
    t.string   "best_hand"
    t.decimal  "best_hand_rank",         precision: 10, scale: 0, default: 0
    t.decimal  "hands_played",           precision: 10, scale: 0, default: 0
    t.decimal  "hands_won",              precision: 10, scale: 0, default: 0
    t.decimal  "folds",                  precision: 10, scale: 0, default: 0
    t.decimal  "raises",                 precision: 10, scale: 0, default: 0
    t.decimal  "checks",                 precision: 10, scale: 0, default: 0
    t.decimal  "bets",                   precision: 10, scale: 0, default: 0
    t.decimal  "total_turns",            precision: 10, scale: 0, default: 0
    t.decimal  "all_ins",                precision: 10, scale: 0, default: 0
    t.decimal  "calls",                  precision: 10, scale: 0, default: 0
    t.string   "login_token"
    t.string   "device_id"
    t.integer  "shootout_level",                                  default: 1
    t.integer  "level",                                           default: 0
    t.decimal  "level_percentage",       precision: 10, scale: 0, default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["login_token"], name: "index_users_on_login_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
