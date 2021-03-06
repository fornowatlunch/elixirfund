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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140928130359) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "connections", :force => true do |t|
    t.integer  "user_id"
    t.integer  "to_user"
    t.boolean  "can_manage"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "connections", ["user_id"], :name => "index_connections_on_user_id"

  create_table "donations", :force => true do |t|
    t.string   "name"
    t.decimal  "amount",     :precision => 5, :scale => 2
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "order_id"
  end

  create_table "invitations", :force => true do |t|
    t.string   "token"
    t.string   "to"
    t.string   "subject"
    t.text     "message"
    t.integer  "invitor_id"
    t.integer  "invitee_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "invitations", ["invitee_id"], :name => "index_invitations_on_invitee_id"
  add_index "invitations", ["invitor_id"], :name => "index_invitations_on_invitor_id"

  create_table "line_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "partner_id"
    t.string   "name"
    t.float    "price"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "patient_id"
    t.integer  "qty"
    t.integer  "wishlist_item_id"
    t.string   "wishlist_item_name"
  end

  add_index "line_items", ["order_id"], :name => "index_line_items_on_order_id"
  add_index "line_items", ["partner_id"], :name => "index_line_items_on_partner_id"
  add_index "line_items", ["product_id"], :name => "index_line_items_on_product_id"

  create_table "orders", :force => true do |t|
    t.string   "name"
    t.float    "subtotal"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "partners", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "address1"
    t.string   "address2"
    t.string   "phone"
    t.string   "fax"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.boolean  "approved"
  end

  create_table "patients", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "phone"
    t.text     "public_bio"
    t.text     "private_bio"
    t.string   "avatar"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "private_wishlist"
  end

  add_index "patients", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "products", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.float    "price"
    t.integer  "partner_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "products", ["partner_id"], :name => "index_products_on_partner_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "stripe_id"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vouchers", :force => true do |t|
    t.integer  "line_item_id"
    t.string   "status"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "code"
  end

  add_index "vouchers", ["line_item_id"], :name => "index_vouchers_on_line_item_id"

  create_table "wishlist_items", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "wishlist_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "qty"
  end

  add_index "wishlist_items", ["wishlist_id"], :name => "index_wishlist_items_on_wishlist_id"

  create_table "wishlist_products", :force => true do |t|
    t.integer  "wishlist_id"
    t.integer  "product_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "qty"
  end

  add_index "wishlist_products", ["product_id"], :name => "index_wishlist_products_on_product_id"
  add_index "wishlist_products", ["wishlist_id"], :name => "index_wishlist_products_on_wishlist_id"

  create_table "wishlists", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "patient_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "private"
  end

  add_index "wishlists", ["patient_id"], :name => "index_wishlists_on_user_id"

end
