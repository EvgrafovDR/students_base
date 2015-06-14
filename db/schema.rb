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

ActiveRecord::Schema.define(version: 20150614171709) do

  create_table "dats", force: :cascade do |t|
    t.date     "dat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fields", force: :cascade do |t|
    t.string   "field_name"
    t.string   "table_name"
    t.string   "field_type"
    t.string   "transl_fn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fines", force: :cascade do |t|
    t.integer  "norm_id"
    t.integer  "dat_id"
    t.float    "fine"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "gender"
    t.integer  "course"
    t.string   "health_group"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "norms", force: :cascade do |t|
    t.string   "name"
    t.boolean  "main"
    t.integer  "dat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "v1"
    t.float    "v2"
    t.float    "v3"
    t.float    "v4"
    t.float    "v5"
    t.float    "v6"
    t.float    "v7"
    t.float    "v8"
    t.float    "v9"
    t.float    "v10"
    t.string   "typ"
  end

  create_table "reltables", force: :cascade do |t|
    t.string   "table1"
    t.string   "table2"
    t.string   "relations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "via"
  end

  create_table "results", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "norm_id"
    t.integer  "dat_id"
    t.float    "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "family_name"
    t.string   "name"
    t.string   "second_name"
    t.integer  "group_id"
    t.integer  "faculty_id"
    t.integer  "teacher_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "family_name"
    t.string   "name"
    t.string   "second_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
