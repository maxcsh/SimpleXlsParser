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

ActiveRecord::Schema.define(version: 20160110120007) do

  create_table "bills", force: :cascade do |t|
    t.string   "company_number"
    t.string   "vat_number"
    t.string   "company_name"
    t.string   "company_address"
    t.string   "company_phone"
    t.float    "pre_paid"
    t.float    "to_be_paid"
    t.float    "total_price"
    t.float    "tax"
    t.float    "tax_price"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "past_payable"
    t.float    "has_paid"
    t.float    "should_be_paid"
    t.float    "allowance"
  end

  create_table "pocket_cashes", force: :cascade do |t|
    t.date     "produced_date"
    t.float    "total_price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "pocket_items", force: :cascade do |t|
    t.integer  "pocket_cash_id"
    t.date     "item_date"
    t.string   "subject"
    t.string   "description"
    t.string   "item_type"
    t.float    "price"
    t.string   "summons_number"
    t.string   "note"
    t.string   "project_code"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "shipping_items", force: :cascade do |t|
    t.integer  "shipping_list_id"
    t.string   "item_name"
    t.string   "spec"
    t.float    "amount"
    t.string   "unit"
    t.float    "unit_price"
    t.float    "sum_price"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "shipping_lists", force: :cascade do |t|
    t.integer  "bill_id"
    t.string   "list_number"
    t.float    "total_price"
    t.float    "tax_price"
    t.string   "note"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
