class CreateMockApiResponses < ActiveRecord::Migration[7.2]
  def change
    create_table :mock_api_responses do |t|
      t.references :mock_api, null: false, foreign_key: true
      t.integer :status_code
      t.json :response_body
      t.json :response_headers

      t.timestamps
    end
  end
end
