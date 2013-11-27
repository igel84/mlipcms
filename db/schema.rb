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

ActiveRecord::Schema.define(:version => 20131122095911) do

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.string   "alias"
    t.string   "domain"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "galeries", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "keywords"
    t.text     "body"
    t.string   "slug"
    t.integer  "site_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "galeries", ["slug"], :name => "index_galeries_on_slug", :unique => true

  create_table "gritter_notices", :force => true do |t|
    t.integer  "owner_id",     :null => false
    t.string   "owner_type",   :null => false
    t.text     "text",         :null => false
    t.text     "options",      :null => false
    t.datetime "delivered_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gritter_notices", ["owner_id", "delivered_at"], :name => "index_gritter_notices_on_owner_id_and_delivered_at"

  create_table "pages", :force => true do |t|
    t.string   "title_ru"
    t.string   "description_ru"
    t.string   "keywords_ru"
    t.text     "body_ru"
    t.boolean  "visible",        :default => true
    t.boolean  "top_menu",       :default => true
    t.boolean  "sub_menu",       :default => true
    t.string   "slug"
    t.integer  "position"
    t.string   "ancestry"
    t.boolean  "home",           :default => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "site_id"
    t.string   "title_en"
    t.string   "body_en"
    t.string   "description_en"
    t.string   "keywords_en"
    t.boolean  "with_news",      :default => false
    t.string   "name_ru"
    t.string   "name_en"
  end

  add_index "pages", ["ancestry"], :name => "index_pages_on_ancestry"
  add_index "pages", ["slug"], :name => "index_pages_on_slug", :unique => true

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.integer  "galery_id"
    t.boolean  "main",       :default => false
    t.string   "image"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title_ru"
    t.text     "body_ru"
    t.string   "preview_ru"
    t.integer  "site_id"
    t.string   "title_en"
    t.text     "body_en"
    t.string   "preview_en"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "show_date"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "alias"
    t.string   "host"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "user_id"
    t.boolean  "locale",     :default => false
  end

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
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
