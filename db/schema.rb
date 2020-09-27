# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_27_082601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conditions", force: :cascade do |t|
    t.text "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "conditions_monsters", id: false, force: :cascade do |t|
    t.bigint "monster_id", null: false
    t.bigint "condition_id", null: false
    t.index ["condition_id", "monster_id"], name: "index_conditions_monsters_on_condition_id_and_monster_id"
    t.index ["monster_id", "condition_id"], name: "index_conditions_monsters_on_monster_id_and_condition_id"
  end

  create_table "family_types", force: :cascade do |t|
    t.text "CreateFamilyTypes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "monsters", force: :cascade do |t|
    t.text "name"
    t.bigint "main_family_type_id"
    t.bigint "sub_family_type_id"
    t.integer "character"
    t.integer "moving_speed"
    t.integer "life_span"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["main_family_type_id"], name: "index_monsters_on_main_family_type_id"
    t.index ["sub_family_type_id"], name: "index_monsters_on_sub_family_type_id"
  end

  create_table "parameters", force: :cascade do |t|
    t.integer "life"
    t.integer "life_apptitude"
    t.integer "power"
    t.integer "power_apptitude"
    t.integer "intelligence"
    t.integer "intelligence_apptitude"
    t.integer "accuracy"
    t.integer "accuracy_apptitude"
    t.integer "avoidance"
    t.integer "avoidance_apptitude"
    t.integer "defence"
    t.integer "defence_apptitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "monsters", "family_types", column: "main_family_type_id"
  add_foreign_key "monsters", "family_types", column: "sub_family_type_id"
end
