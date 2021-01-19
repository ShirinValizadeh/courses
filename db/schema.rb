

ActiveRecord::Schema.define(version: 2021_01_19_151729) do

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "published"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
