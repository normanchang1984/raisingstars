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

ActiveRecord::Schema.define(version: 20150727132616) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "content",     limit: 65535
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "proposal_id", limit: 4
  end

  add_index "comments", ["proposal_id"], name: "index_comments_on_proposal_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "phone",           limit: 255
    t.string   "address",         limit: 255
    t.string   "payment_method",  limit: 255
    t.integer  "amount",          limit: 4
    t.integer  "user_id",         limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "product_id",      limit: 4
    t.string   "payment_status",  limit: 255, default: "pending"
    t.string   "shipping_status", limit: 255, default: "pending"
  end

  add_index "orders", ["product_id"], name: "index_orders_on_product_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.string   "type",           limit: 255
    t.string   "payment_method", limit: 255
    t.integer  "order_id",       limit: 4
    t.integer  "amount",         limit: 4
    t.boolean  "paid",           limit: 1,     default: false
    t.text     "params",         limit: 65535
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "payments", ["order_id"], name: "index_payments_on_order_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.integer  "price",       limit: 4
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "proposal_id", limit: 4
  end

  add_index "products", ["proposal_id"], name: "index_products_on_proposal_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "proposals", force: :cascade do |t|
    t.string   "name",                         limit: 255
    t.string   "email",                        limit: 255
    t.string   "phone",                        limit: 255
    t.text     "self_intro",                   limit: 65535
    t.string   "title",                        limit: 255
    t.text     "content",                      limit: 65535
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "views",                        limit: 4
    t.integer  "category_id",                  limit: 4
    t.integer  "user_id",                      limit: 4
    t.string   "title_graph_url_file_name",    limit: 255
    t.string   "title_graph_url_content_type", limit: 255
    t.integer  "title_graph_url_file_size",    limit: 4
    t.datetime "title_graph_url_updated_at"
    t.string   "youtube_url",                  limit: 255
  end

  add_index "proposals", ["category_id"], name: "index_proposals_on_category_id", using: :btree
  add_index "proposals", ["user_id"], name: "index_proposals_on_user_id", using: :btree

  create_table "rewards", force: :cascade do |t|
    t.integer  "price",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "user_reward_proposals", force: :cascade do |t|
    t.integer  "proposal_id", limit: 4
    t.integer  "reward_id",   limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "userproposalships", force: :cascade do |t|
    t.integer  "proposal_id", limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "userproposalships", ["proposal_id"], name: "index_userproposalships_on_proposal_id", using: :btree
  add_index "userproposalships", ["user_id"], name: "index_userproposalships_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                   limit: 255, default: "", null: false
    t.string   "encrypted_password",      limit: 255, default: "", null: false
    t.string   "reset_password_token",    limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",      limit: 255
    t.string   "last_sign_in_ip",         limit: 255
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "fb_uid",                  limit: 255
    t.string   "fb_token",                limit: 255
    t.string   "avatar_url_file_name",    limit: 255
    t.string   "avatar_url_content_type", limit: 255
    t.integer  "avatar_url_file_size",    limit: 4
    t.datetime "avatar_url_updated_at"
    t.string   "provider",                limit: 255
    t.string   "uid",                     limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
