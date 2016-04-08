ActiveRecord::Schema.define(version: 20160408184140) do

  enable_extension "plpgsql"

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
