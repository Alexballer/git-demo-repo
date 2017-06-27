ActiveRecord::Schema.define(version: 20170313003558) do
    #These are extensions that must be enabled in order to support this database
  enable_extension “plpgsql”

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "slug"
    t.integer "status",    default: 0
    t.index ["slug"], name: "index_blogs_on_slug", unique: true, using: :btree
  end

class CreateFriendlyIdSlugs < ActiveRecord::Migration
  def change
    create_table :FriendlyId_slugs do |t|
      t.string   :slug,           :null => false
      t.integer  :sluggable_id,   :null => false
      t.string   :sluggable_type, :limit => 50
      t.string   :scope
      t.datetime :created_at
    t.index :friendly_id_slugs, :sluggable_id
    t.index :friendly_id_slugs, [:slug, :sluggable_type]
    t.index :friendly_id_slugs, [:slug, :sluggable_type, :scope], :unique => true
    t.index :friendly_id_slugs, :sluggable_type
  end
  create_table "portfolios", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "body"
    t.text     "main_image"
    t.text     "thumb_image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

 create_table "skills", force: :cascade do |t|
    t.string   "title"
    t.integer  "percent_utilized"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end
end