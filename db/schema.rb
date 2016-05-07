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

ActiveRecord::Schema.define(version: 20160507142608) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "companies", force: :cascade do |t|
    t.text     "summary_pt"
    t.text     "summary_en"
    t.text     "summary_es"
    t.text     "address_pt"
    t.text     "address_en"
    t.text     "address_es"
    t.text     "email"
    t.text     "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name_pt"
    t.string   "name_en"
    t.string   "name_es"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "contact_id"
  end

  add_index "departments", ["contact_id"], name: "index_departments_on_contact_id"

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "role_pt"
    t.string   "role_en"
    t.string   "role_es"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "company_id"
  end

  add_index "employees", ["company_id"], name: "index_employees_on_company_id"

  create_table "jobs", force: :cascade do |t|
    t.string   "video_url"
    t.string   "title_pt"
    t.string   "title_es"
    t.string   "title_en"
    t.string   "password"
    t.text     "synopsis_pt"
    t.text     "format_pt"
    t.text     "genre_pt"
    t.text     "subgenre_pt"
    t.text     "running_time_pt"
    t.text     "target_pt"
    t.text     "created_by_pt"
    t.text     "written_by_pt"
    t.text     "directed_by_pt"
    t.text     "status"
    t.text     "player"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "synopsis_es"
    t.text     "synopsis_en"
    t.text     "format_es"
    t.text     "format_en"
    t.text     "genre_es"
    t.text     "genre_en"
    t.text     "subgenre_es"
    t.text     "subgenre_en"
    t.text     "running_time_es"
    t.text     "running_time_en"
    t.text     "target_es"
    t.text     "target_en"
    t.text     "created_by_es"
    t.text     "created_by_en"
    t.text     "written_by_es"
    t.text     "written_by_en"
    t.text     "directed_by_es"
    t.text     "directed_by_en"
    t.integer  "video_id"
    t.string   "video_thumb_small"
    t.string   "video_thumb_medium"
    t.string   "video_thumb_large"
  end

end
