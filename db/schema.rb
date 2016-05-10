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

ActiveRecord::Schema.define(version: 20160510074613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acceptors", force: :cascade do |t|
    t.string   "name_acceptor"
    t.string   "bank_acceptor"
    t.string   "account_acceptor"
    t.string   "key_acceptor"
    t.string   "mfo_acceptor"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "operations", force: :cascade do |t|
    t.datetime "date_time_pay"
    t.date     "date_valut"
    t.string   "num_ticket"
    t.string   "code_ticket"
    t.string   "key_operation"
    t.text     "destination"
    t.money    "sum_operation",      scale: 2
    t.string   "currency_operation"
    t.string   "priv_acc_payer"
    t.date     "period_pay_start"
    t.date     "period_pay_end"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "payer_id"
    t.integer  "acceptor_id"
    t.integer  "service_id"
  end

  add_index "operations", ["acceptor_id"], name: "index_operations_on_acceptor_id", using: :btree
  add_index "operations", ["payer_id"], name: "index_operations_on_payer_id", using: :btree
  add_index "operations", ["service_id"], name: "index_operations_on_service_id", using: :btree

  create_table "payers", force: :cascade do |t|
    t.integer  "id_main"
    t.string   "fio"
    t.string   "adress"
    t.string   "invoice"
    t.string   "telephone"
    t.string   "bank_payer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name_service"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "operations", "acceptors"
  add_foreign_key "operations", "payers"
  add_foreign_key "operations", "services"
end
