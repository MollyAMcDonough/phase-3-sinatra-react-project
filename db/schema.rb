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

ActiveRecord::Schema.define(version: 2022_03_29_151750) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "priorities", force: :cascade do |t|
    t.integer "value"
    t.string "description"
  end

  create_table "task_defs", force: :cascade do |t|
    t.integer "category_id"
    t.integer "priority_id"
    t.string "title"
    t.string "description"
    t.string "rRule"
    t.string "exDate", default: ""
    t.string "location"
    t.index ["category_id"], name: "index_task_defs_on_category_id"
    t.index ["priority_id"], name: "index_task_defs_on_priority_id"
  end

  create_table "task_times", force: :cascade do |t|
    t.integer "task_def_id"
    t.datetime "startDate"
    t.datetime "endDate"
    t.boolean "allDay"
    t.index ["task_def_id"], name: "index_task_times_on_task_def_id"
  end

end
