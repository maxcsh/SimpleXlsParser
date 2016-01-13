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

ActiveRecord::Schema.define(version: 20160113042443) do

  create_table "bills", force: :cascade do |t|
    t.string   "company_number",  limit: 255
    t.string   "vat_number",      limit: 255
    t.string   "company_name",    limit: 255
    t.string   "company_address", limit: 255
    t.string   "company_phone",   limit: 255
    t.float    "pre_paid",        limit: 24
    t.float    "to_be_paid",      limit: 24
    t.float    "total_price",     limit: 24
    t.float    "tax",             limit: 24
    t.float    "tax_price",       limit: 24
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.float    "past_payable",    limit: 24
    t.float    "has_paid",        limit: 24
    t.float    "should_be_paid",  limit: 24
    t.float    "allowance",       limit: 24
  end

  create_table "business_cards", force: :cascade do |t|
    t.string   "category_number", limit: 255
    t.string   "category",        limit: 255
    t.string   "company_name",    limit: 255
    t.string   "name",            limit: 255
    t.string   "title",           limit: 255
    t.string   "phone",           limit: 255
    t.string   "tax_phone",       limit: 255
    t.string   "mobile_phone",    limit: 255
    t.string   "address",         limit: 255
    t.string   "email",           limit: 255
    t.string   "vat_number",      limit: 255
    t.string   "note",            limit: 255
    t.string   "old_created_at",  limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "customers", force: :cascade do |t|
    t.integer  "number",           limit: 4
    t.string   "company_name",     limit: 255
    t.string   "agent",            limit: 255
    t.string   "contact_1",        limit: 255
    t.string   "contact_phone_1",  limit: 255
    t.string   "contact_mobile_1", limit: 255
    t.string   "contact_email_1",  limit: 255
    t.string   "contact_2",        limit: 255
    t.string   "contact_phone_2",  limit: 255
    t.string   "contact_mobile_2", limit: 255
    t.string   "contact_email_2",  limit: 255
    t.string   "contact_3",        limit: 255
    t.string   "contact_phone_3",  limit: 255
    t.string   "contact_mobile_3", limit: 255
    t.string   "contact_email_3",  limit: 255
    t.string   "address",          limit: 255
    t.string   "vat_number",       limit: 255
    t.string   "fax",              limit: 255
    t.date     "signed_date"
    t.string   "branch_company",   limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "company_title",    limit: 255
    t.text     "note",             limit: 65535
    t.string   "company_phone1",   limit: 255
    t.string   "company_phone2",   limit: 255
    t.string   "company_phone3",   limit: 255
  end

  create_table "pocket_cashes", force: :cascade do |t|
    t.date     "produced_date"
    t.float    "total_price",   limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "pocket_items", force: :cascade do |t|
    t.integer  "pocket_cash_id", limit: 4
    t.date     "item_date"
    t.string   "subject",        limit: 255
    t.string   "description",    limit: 255
    t.string   "item_type",      limit: 255
    t.float    "price",          limit: 24
    t.string   "summons_number", limit: 255
    t.string   "note",           limit: 255
    t.string   "project_code",   limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "shipping_items", force: :cascade do |t|
    t.integer  "shipping_list_id", limit: 4
    t.string   "item_name",        limit: 255
    t.string   "spec",             limit: 255
    t.float    "amount",           limit: 24
    t.string   "unit",             limit: 255
    t.float    "unit_price",       limit: 24
    t.float    "sum_price",        limit: 24
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "shipping_lists", force: :cascade do |t|
    t.integer  "bill_id",     limit: 4
    t.string   "list_number", limit: 255
    t.float    "total_price", limit: 24
    t.float    "tax_price",   limit: 24
    t.string   "note",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
