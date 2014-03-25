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

ActiveRecord::Schema.define(version: 20140325183661) do

  create_table "helpdesk_comments", force: true do |t|
    t.integer  "ticket_id"
    t.text     "comment"
    t.integer  "author_id"
    t.boolean  "public"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "helpdesk_faq_translations", force: true do |t|
    t.integer  "helpdesk_faq_id", null: false
    t.string   "locale",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "text"
  end

  add_index "helpdesk_faq_translations", ["helpdesk_faq_id"], name: "index_helpdesk_faq_translations_on_helpdesk_faq_id", using: :btree
  add_index "helpdesk_faq_translations", ["locale"], name: "index_helpdesk_faq_translations_on_locale", using: :btree

  create_table "helpdesk_faqs", force: true do |t|
    t.integer  "position"
    t.boolean  "active",     default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "helpdesk_subscribers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "lang"
    t.string   "hashcode"
    t.boolean  "confirmed",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "helpdesk_ticket_type_translations", force: true do |t|
    t.integer  "helpdesk_ticket_type_id", null: false
    t.string   "locale",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "helpdesk_ticket_type_translations", ["helpdesk_ticket_type_id"], name: "index_554cec9438d399db021564d4a79520a28d0749cc", using: :btree
  add_index "helpdesk_ticket_type_translations", ["locale"], name: "index_helpdesk_ticket_type_translations_on_locale", using: :btree

  create_table "helpdesk_ticket_types", force: true do |t|
    t.integer  "position"
    t.boolean  "active",     default: true, null: false
    t.string   "tr_class"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "helpdesk_tickets", force: true do |t|
    t.string   "subject"
    t.text     "description"
    t.integer  "requester_id"
    t.integer  "assignee_id"
    t.string   "status"
    t.integer  "ticket_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
