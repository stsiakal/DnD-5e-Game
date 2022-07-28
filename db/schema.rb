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

ActiveRecord::Schema[7.0].define(version: 2022_07_28_100618) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ability_scores", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.string "desc"
    t.string "full_name"
    t.jsonb "skills", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "level"
    t.jsonb "ability_scores", default: {}, null: false
    t.jsonb "race", default: {}, null: false
    t.jsonb "character_class", default: {}, null: false
    t.jsonb "alignment", default: {}, null: false
    t.jsonb "background", default: {}, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "chararacter_classes", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.integer "hit_die"
    t.jsonb "class_levels", default: {}, null: false
    t.jsonb "multi_classing", default: {}, null: false
    t.jsonb "spellcasting", default: {}, null: false
    t.jsonb "spells", default: {}, null: false
    t.jsonb "starting_equipment", default: {}, null: false
    t.jsonb "starting_equipment_options", default: {}, null: false
    t.jsonb "proficiency_choises", default: {}, null: false
    t.jsonb "proficiencies", default: {}, null: false
    t.jsonb "saving_throws", default: {}, null: false
    t.jsonb "subclasses", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.string "url"
    t.text "desc", default: [], array: true
    t.jsonb "equipment_category", default: {}, null: false
    t.string "weapon_category"
    t.string "weapon_range"
    t.string "category_range"
    t.jsonb "range", default: {}, null: false
    t.jsonb "damage", default: {}, null: false
    t.jsonb "two_handed_damage", default: {}, null: false
    t.jsonb "properties", default: {}, null: false
    t.jsonb "cost", default: {}, null: false
    t.integer "weight"
    t.string "armor_category"
    t.jsonb "armor_class", default: {}, null: false
    t.integer "str_minimum"
    t.boolean "stealth_disadvantage", default: false
    t.jsonb "gear_category", default: {}, null: false
    t.jsonb "contents", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_mechanics", force: :cascade do |t|
    t.jsonb "conditions", default: {}, null: false
    t.jsonb "damage_types", default: {}, null: false
    t.jsonb "magic_schools", default: {}, null: false
    t.jsonb "feats", default: {}, null: false
    t.jsonb "features", default: {}, null: false
    t.jsonb "rule_sections", default: {}, null: false
    t.jsonb "rules", default: {}, null: false
    t.jsonb "traits", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monsters", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc", default: [], array: true
    t.integer "charisma"
    t.integer "constitution"
    t.integer "dexterity"
    t.integer "intelligence"
    t.integer "strength"
    t.integer "wisdom"
    t.text "size", default: [], array: true
    t.string "type"
    t.string "subtype"
    t.text "alignments", default: [], array: true
    t.integer "armor_class"
    t.integer "hit_points"
    t.string "hit_dice"
    t.jsonb "actions", default: {}, null: false
    t.jsonb "legendary_actions", default: {}, null: false
    t.integer "challenge_rating"
    t.jsonb "condition_immunities", default: {}, null: false
    t.string "damage_immunities", default: [], array: true
    t.string "damage_resistances", default: [], array: true
    t.string "damage_vulnerabilities", default: [], array: true
    t.jsonb "forms", default: {}, null: false
    t.string "languages"
    t.jsonb "proficiencies", default: {}, null: false
    t.jsonb "reactions", default: {}, null: false
    t.jsonb "senses", default: {}, null: false
    t.jsonb "special_abilities", default: {}, null: false
    t.jsonb "speed", default: {}, null: false
    t.integer "xp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.integer "speed"
    t.jsonb "ability_bonuses", default: {}, null: false
    t.string "alignment"
    t.string "age"
    t.string "size"
    t.jsonb "size_description", default: {}, null: false
    t.jsonb "starting_proficiencies", default: {}, null: false
    t.jsonb "starting_proficiency_options"
    t.jsonb "languages", default: {}, null: false
    t.jsonb "language_description", default: {}, null: false
    t.jsonb "traits", default: {}, null: false
    t.jsonb "subraces", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spells", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc", default: [], array: true
    t.string "higher_level"
    t.string "range"
    t.text "components", default: [], array: true
    t.string "material"
    t.boolean "ritual"
    t.string "duration"
    t.boolean "concetration"
    t.string "casting_time"
    t.integer "level"
    t.string "attack_type"
    t.jsonb "damage", default: {}, null: false
    t.jsonb "school", default: {}, null: false
    t.jsonb "classes", default: {}, null: false
    t.jsonb "subclasses", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "characters", "users"
end
