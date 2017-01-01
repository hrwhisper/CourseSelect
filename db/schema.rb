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

ActiveRecord::Schema.define(version: 20161230113557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.integer  "comment_1"
    t.integer  "comment_2"
    t.integer  "comment_3"
    t.integer  "comment_4"
    t.integer  "comment_5"
    t.integer  "comment_6"
    t.integer  "comment_7"
    t.integer  "comment_8"
    t.integer  "comment_9"
    t.integer  "comment_10"
    t.integer  "comment_11"
    t.integer  "comment_12"
    t.integer  "comment_13"
    t.integer  "comment_14"
    t.integer  "comment_15"
    t.integer  "comment_16"
    t.integer  "comment_17"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "commented",   default: false
    t.text     "Commenttext"
  end

  add_index "comments", ["course_id"], name: "index_comments_on_course_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "course_code"
    t.string   "course_type"
    t.string   "teaching_type"
    t.string   "exam_type"
    t.string   "credit"
    t.integer  "limit_num"
    t.string   "class_room"
    t.string   "course_time"
    t.string   "course_week"
    t.integer  "teacher_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "open",          default: false
    t.text     "outline",       default: "本课程暂无大纲"
    t.string   "tmp"
    t.text     "diss",          default: "暂无人发言"
    t.integer  "year"
    t.integer  "term_num",      default: 1
  end

  create_table "discussions", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "user"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "discussions", ["course_id"], name: "index_discussions_on_course_id", using: :btree

  create_table "grades", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.integer  "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "grades", ["course_id"], name: "index_grades_on_course_id", using: :btree
  add_index "grades", ["user_id"], name: "index_grades_on_user_id", using: :btree

  create_table "notices", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notices", ["user_id"], name: "index_notices_on_user_id", using: :btree

  create_table "systeminfos", force: :cascade do |t|
    t.string "name"
    t.string "value"
  end

  add_index "systeminfos", ["name"], name: "index_systeminfos_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "num"
    t.string   "major"
    t.string   "department"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.boolean  "teacher",         default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["num"], name: "index_users_on_num", unique: true, using: :btree

end
