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

ActiveRecord::Schema[7.0].define(version: 2022_08_12_103142) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ability_scores", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.string "desc"
    t.string "full_name"
    t.jsonb "skills", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "adventuring_gears", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc"
    t.jsonb "equipment_category"
    t.jsonb "gear_category"
    t.jsonb "cost"
    t.integer "weight"
    t.string "equipment_type"
    t.bigint "equipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_type", "equipment_id"], name: "index_adventuring_gears_on_equipment"
  end

  create_table "alignments", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "armor_and_shields", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc"
    t.jsonb "equipment_category"
    t.string "armor_category"
    t.jsonb "armor_class"
    t.integer "str_minimum"
    t.boolean "stealth_disadvantage"
    t.jsonb "cost"
    t.integer "weight"
    t.string "equipment_type"
    t.bigint "equipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_type", "equipment_id"], name: "index_armor_and_shields_on_equipment"
  end

  create_table "backgrounds", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.jsonb "starting_proficiencies"
    t.jsonb "language_options"
    t.jsonb "starting_equipment"
    t.jsonb "starting_equipment_options"
    t.jsonb "feature"
    t.jsonb "personality_traits"
    t.jsonb "ideals"
    t.jsonb "bonds"
    t.jsonb "flaws"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "character_classes", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.integer "hit_die"
    t.jsonb "class_levels", default: {}
    t.jsonb "multi_classing", default: {}
    t.jsonb "spellcasting", default: {}
    t.jsonb "spells", default: {}
    t.jsonb "starting_equipment", default: {}
    t.jsonb "starting_equipment_options", default: {}
    t.jsonb "proficiency_choices"
    t.jsonb "proficiencies"
    t.jsonb "saving_throws"
    t.jsonb "subclasses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "level", null: false
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

  create_table "conditions", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "damage_types", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment_categories", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment_packs", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc"
    t.jsonb "equipment_category"
    t.jsonb "gear_category"
    t.jsonb "cost"
    t.jsonb "contents"
    t.string "equipment_type"
    t.bigint "equipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_type", "equipment_id"], name: "index_equipment_packs_on_equipment"
  end

  create_table "feats", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc"
    t.jsonb "prerequisites"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc"
    t.integer "level"
    t.jsonb "classes"
    t.jsonb "prerequisites"
    t.jsonb "subclass"
    t.jsonb "feature_specific"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.string "type"
    t.string "typical_speakers"
    t.string "script"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "magic_items", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc"
    t.jsonb "equipment_category"
    t.jsonb "rarity"
    t.jsonb "variants"
    t.boolean "variant"
    t.string "equipment_type"
    t.bigint "equipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_type", "equipment_id"], name: "index_magic_items_on_equipment"
  end

  create_table "magic_schools", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monsters", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc"
    t.integer "charisma"
    t.integer "constitution"
    t.integer "dexterity"
    t.integer "intelligence"
    t.integer "strength"
    t.integer "wisdom"
    t.text "size"
    t.string "type"
    t.string "subtype"
    t.text "alignment"
    t.integer "armor_class"
    t.integer "hit_points"
    t.string "hit_dice"
    t.jsonb "actions", default: {}
    t.jsonb "legendary_actions", default: {}
    t.integer "challenge_rating"
    t.jsonb "condition_immunities", default: {}
    t.string "damage_immunities"
    t.string "damage_resistances"
    t.string "damage_vulnerabilities"
    t.jsonb "forms", default: {}
    t.string "languages"
    t.jsonb "proficiencies", default: {}
    t.jsonb "reactions", default: {}
    t.jsonb "senses", default: {}
    t.jsonb "special_abilities", default: {}
    t.jsonb "speed", default: {}
    t.integer "xp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mounts_and_vehicles", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc"
    t.jsonb "equipment_category"
    t.text "vehicle_category"
    t.jsonb "cost"
    t.jsonb "speed"
    t.string "capacity"
    t.text "contents"
    t.text "properties"
    t.string "equipment_type"
    t.bigint "equipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_type", "equipment_id"], name: "index_mounts_and_vehicles_on_equipment"
  end

  create_table "proficiencies", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.string "type"
    t.jsonb "classes", default: {}
    t.jsonb "races", default: {}
    t.jsonb "reference", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.integer "speed"
    t.jsonb "ability_bonuses", default: {}
    t.string "alignment"
    t.string "age"
    t.string "size"
    t.jsonb "size_description", default: {}
    t.jsonb "starting_proficiencies", default: {}
    t.jsonb "starting_proficiency_options", default: {}
    t.jsonb "languages", default: {}
    t.jsonb "language_description", default: {}
    t.jsonb "traits", default: {}
    t.jsonb "subraces", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rule_sections", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rules", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.string "desc"
    t.jsonb "subsections"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc"
    t.jsonb "ability_score", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spells", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc"
    t.string "higher_level"
    t.string "range"
    t.text "components"
    t.string "material"
    t.boolean "ritual", default: false
    t.string "duration"
    t.boolean "concetration", default: false
    t.string "casting_time"
    t.integer "level"
    t.jsonb "damage", default: {}
    t.jsonb "dc"
    t.jsonb "area_of_effect"
    t.jsonb "school", default: {}
    t.jsonb "classes", default: {}
    t.jsonb "subclasses", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subclasses", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc"
    t.jsonb "classes"
    t.string "subclass_flavor"
    t.jsonb "subclass_levels"
    t.jsonb "features"
    t.jsonb "spells"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subraces", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc"
    t.jsonb "race"
    t.jsonb "ability_bonuses"
    t.jsonb "starting_proficiencies"
    t.jsonb "languages"
    t.jsonb "language_options"
    t.jsonb "racial_traits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tools", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc"
    t.jsonb "equipment_category"
    t.jsonb "special"
    t.text "tool_category"
    t.jsonb "cost"
    t.integer "weight"
    t.text "contents"
    t.text "properties"
    t.string "equipment_type"
    t.bigint "equipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_type", "equipment_id"], name: "index_tools_on_equipment"
  end

  create_table "traits", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.string "desc"
    t.jsonb "races", default: {}
    t.jsonb "subraces", default: {}
    t.jsonb "parent", default: {}
    t.jsonb "proficiencies", default: {}
    t.jsonb "proficiency_choices", default: {}
    t.jsonb "trait_specific", default: {}
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
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weapon_properties", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapons", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.text "desc"
    t.jsonb "equipment_category"
    t.string "weapon_category"
    t.string "weapon_range"
    t.string "category_range"
    t.jsonb "range"
    t.jsonb "damage"
    t.jsonb "two_handed_damange"
    t.jsonb "properties"
    t.jsonb "cost"
    t.integer "weight"
    t.string "equipment_type"
    t.bigint "equipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_type", "equipment_id"], name: "index_weapons_on_equipment"
  end

  add_foreign_key "characters", "users"
end
