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

ActiveRecord::Schema.define(version: 20200220200641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "area"
    t.string "web"
    t.integer "linkeind_id"
    t.integer "country", default: 0
    t.integer "size"
    t.string "email"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "person_id"
    t.string "role"
    t.date "start_date"
    t.date "end_date"
    t.index ["company_id"], name: "index_jobs_on_company_id"
    t.index ["person_id"], name: "index_jobs_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.string "last_name"
    t.integer "linkedIn_id"
    t.date "born_date"
    t.string "phone"
    t.string "url"
    t.bigint "job_id"
    t.string "email"
    t.index ["job_id"], name: "index_people_on_job_id"
  end

  add_foreign_key "people", "jobs"
end
