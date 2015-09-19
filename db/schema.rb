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

ActiveRecord::Schema.define(version: 20150919201931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.integer  "players_count"
    t.decimal  "amount_per_card"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "player1"
    t.string   "player2"
    t.string   "player3"
    t.string   "player4"
    t.integer  "rule_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rosters", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rules", force: :cascade do |t|
    t.boolean  "winner_points"
    t.integer  "winner_points_amount"
    t.integer  "line1_min"
    t.integer  "line1_max"
    t.integer  "line1_multiplier"
    t.integer  "line2_min"
    t.integer  "line2_max"
    t.integer  "line2_multiplier"
    t.integer  "line3_min"
    t.integer  "line3_max"
    t.integer  "line3_multiplier"
    t.integer  "line4_min"
    t.integer  "line4_max"
    t.integer  "line4_multiplier"
    t.integer  "line5_min"
    t.integer  "line5_max"
    t.integer  "line5_multiplier"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "title"
  end

end
