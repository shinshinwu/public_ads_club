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

ActiveRecord::Schema.define(version: 20160227221143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "listing_id"
    t.string   "line_1"
    t.string   "line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "country"
    t.decimal  "lat"
    t.decimal  "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "is_available"
    t.string   "title"
    t.text     "description"
    t.string   "company_name"
    t.string   "phone"
    t.string   "ref_id"
    t.integer  "width"
    t.integer  "height"
    t.float    "base_amount"
    t.float    "recurring_amount"
    t.string   "charge_frequency"
    t.integer  "min_lease_days"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "listing_id"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.string   "subject"
    t.text     "body"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "transaction_id"
  end

  add_index "messages", ["transaction_id"], name: "index_messages_on_transaction_id", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.integer  "listing_id"
    t.date     "expires_at"
    t.datetime "last_charged_at"
    t.string   "last_cc_error"
    t.boolean  "auto_renewal"
    t.string   "renewal_period"
    t.float    "price"
    t.string   "charge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "customer_id"
    t.string   "payment_token"
  end

end
