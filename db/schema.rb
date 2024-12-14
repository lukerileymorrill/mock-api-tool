# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_12_14_053543) do
  create_table "mock_api_responses", force: :cascade do |t|
    t.integer "mock_api_id", null: false
    t.integer "status_code"
    t.json "response_body"
    t.json "response_headers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mock_api_id"], name: "index_mock_api_responses_on_mock_api_id"
  end

  create_table "mock_apis", force: :cascade do |t|
    t.string "endpoint"
    t.string "method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "request_body"
    t.json "request_headers"
    t.json "request_params"
  end

  add_foreign_key "mock_api_responses", "mock_apis"
end
