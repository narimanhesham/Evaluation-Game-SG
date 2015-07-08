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

ActiveRecord::Schema.define(version: 20150530124006) do

  create_table "avatars", force: :cascade do |t|
    t.string   "avatar_100", limit: 255
    t.string   "avatar_80",  limit: 255
    t.string   "avatar_60",  limit: 255
    t.string   "avatar_40",  limit: 255
    t.string   "avatar_20",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "bonus_questions", force: :cascade do |t|
    t.integer  "city_id",          limit: 4
    t.integer  "location_hint_id", limit: 4
    t.string   "image",            limit: 255
    t.string   "question",         limit: 255
    t.string   "choice_A",         limit: 255
    t.string   "choice_B",         limit: 255
    t.string   "choice_C",         limit: 255
    t.string   "choice_D",         limit: 255
    t.string   "correct_choice",   limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "bonus_questions", ["city_id"], name: "index_bonus_questions_on_city_id", using: :btree
  add_index "bonus_questions", ["location_hint_id"], name: "index_bonus_questions_on_location_hint_id", using: :btree

  create_table "checkpoints", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "educational_level_id", limit: 4
    t.integer  "continent_id",         limit: 4
  end

  add_index "checkpoints", ["continent_id"], name: "index_checkpoints_on_continent_id", using: :btree
  add_index "checkpoints", ["educational_level_id"], name: "index_checkpoints_on_educational_level_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.integer  "checkpoint_id", limit: 4
    t.string   "name",          limit: 255, default: ""
    t.string   "latitude",      limit: 255
    t.string   "longitude",     limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "continent_id",  limit: 4
  end

  add_index "cities", ["checkpoint_id"], name: "index_cities_on_checkpoint_id", using: :btree
  add_index "cities", ["continent_id"], name: "index_cities_on_continent_id", using: :btree

  create_table "cities_questions", force: :cascade do |t|
    t.integer "city_id",     limit: 4
    t.integer "question_id", limit: 4
  end

  add_index "cities_questions", ["city_id"], name: "index_cities_questions_on_city_id", using: :btree
  add_index "cities_questions", ["question_id"], name: "index_cities_questions_on_question_id", using: :btree

  create_table "continents", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "educational_levels", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer  "player_id",         limit: 4
    t.integer  "city_id",           limit: 4
    t.integer  "correct_questions", limit: 4
    t.integer  "score",             limit: 4
    t.string   "mode",              limit: 255
    t.integer  "invention_id",      limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "games", ["city_id"], name: "index_games_on_city_id", using: :btree
  add_index "games", ["invention_id"], name: "index_games_on_invention_id", using: :btree
  add_index "games", ["player_id"], name: "index_games_on_player_id", using: :btree

  create_table "games_lessons", force: :cascade do |t|
    t.integer "game_id",   limit: 4
    t.integer "lesson_id", limit: 4
  end

  add_index "games_lessons", ["game_id"], name: "index_games_lessons_on_game_id", using: :btree
  add_index "games_lessons", ["lesson_id"], name: "index_games_lessons_on_lesson_id", using: :btree

  create_table "games_questions", force: :cascade do |t|
    t.integer "game_id",     limit: 4
    t.integer "question_id", limit: 4
  end

  add_index "games_questions", ["game_id"], name: "index_games_questions_on_game_id", using: :btree
  add_index "games_questions", ["question_id"], name: "index_games_questions_on_question_id", using: :btree

  create_table "inventions", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "category",    limit: 255
    t.text     "information", limit: 65535
    t.string   "full_image",  limit: 255
    t.string   "part1",       limit: 255
    t.string   "part2",       limit: 255
    t.string   "part3",       limit: 255
    t.string   "part4",       limit: 255
    t.string   "part5",       limit: 255
    t.string   "part6",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "inventions_players", force: :cascade do |t|
    t.integer "player_id",    limit: 4
    t.integer "invention_id", limit: 4
  end

  add_index "inventions_players", ["invention_id"], name: "index_inventions_players_on_invention_id", using: :btree
  add_index "inventions_players", ["player_id"], name: "index_inventions_players_on_player_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "unit_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "number",     limit: 4
  end

  add_index "lessons", ["unit_id"], name: "index_lessons_on_unit_id", using: :btree

  create_table "location_hints", force: :cascade do |t|
    t.integer  "city_id",     limit: 4
    t.string   "image",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "information", limit: 65535
    t.string   "latitude",    limit: 255
    t.string   "longitude",   limit: 255
  end

  add_index "location_hints", ["city_id"], name: "index_location_hints_on_city_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "username",               limit: 255
    t.integer  "health_percentage",      limit: 4
    t.text     "health_description",     limit: 65535
    t.integer  "avatar_id",              limit: 4
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "players", ["avatar_id"], name: "index_players_on_avatar_id", using: :btree
  add_index "players", ["email"], name: "index_players_on_email", unique: true, using: :btree
  add_index "players", ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true, using: :btree

  create_table "question_locations", force: :cascade do |t|
    t.integer  "number",     limit: 4
    t.text     "hint",       limit: 65535
    t.string   "latitude",   limit: 255
    t.string   "longitude",  limit: 255
    t.integer  "city_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "question_locations", ["city_id"], name: "index_question_locations_on_city_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "lesson_id",            limit: 4
    t.string   "content",              limit: 255
    t.string   "choice_A",             limit: 255
    t.string   "choice_B",             limit: 255
    t.string   "choice_C",             limit: 255
    t.string   "choice_D",             limit: 255
    t.string   "correct_choice",       limit: 255
    t.string   "eliminated_choices",   limit: 255
    t.string   "explaination",         limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "educational_level_id", limit: 4
  end

  add_index "questions", ["educational_level_id"], name: "index_questions_on_educational_level_id", using: :btree
  add_index "questions", ["lesson_id"], name: "index_questions_on_lesson_id", using: :btree

  create_table "units", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "number",     limit: 4
  end

  add_foreign_key "bonus_questions", "cities"
  add_foreign_key "bonus_questions", "location_hints"
  add_foreign_key "checkpoints", "continents"
  add_foreign_key "checkpoints", "educational_levels"
  add_foreign_key "cities", "checkpoints"
  add_foreign_key "cities", "continents"
  add_foreign_key "cities_questions", "cities"
  add_foreign_key "cities_questions", "questions"
  add_foreign_key "games", "cities"
  add_foreign_key "games", "inventions"
  add_foreign_key "games", "players"
  add_foreign_key "games_lessons", "games"
  add_foreign_key "games_lessons", "lessons"
  add_foreign_key "games_questions", "games"
  add_foreign_key "games_questions", "questions"
  add_foreign_key "inventions_players", "inventions"
  add_foreign_key "inventions_players", "players"
  add_foreign_key "lessons", "units"
  add_foreign_key "location_hints", "cities"
  add_foreign_key "players", "avatars"
  add_foreign_key "question_locations", "cities"
  add_foreign_key "questions", "educational_levels"
  add_foreign_key "questions", "lessons"
end
