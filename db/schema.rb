# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090829230554) do

  create_table "buildings", :force => true do |t|
    t.string   "name",                                       :null => false
    t.string   "code",                                       :null => false
    t.string   "address",                                    :null => false
    t.string   "zip_code",                                   :null => false
    t.integer  "floors"
    t.decimal  "lat",        :precision => 15, :scale => 10
    t.decimal  "lng",        :precision => 15, :scale => 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buildings_features", :id => false, :force => true do |t|
    t.integer "building_id", :null => false
    t.integer "feature_id",  :null => false
  end

  create_table "features", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       :limit => 50, :null => false
  end

  create_table "obbjects", :force => true do |t|
    t.string   "name"
    t.integer  "floor"
    t.text     "description"
    t.integer  "building_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
