class CreateMockApis < ActiveRecord::Migration[7.2]
  def change
    create_table :mock_apis do |t|
      t.string :endpoint
      t.string :method

      t.timestamps
    end
  end
end
