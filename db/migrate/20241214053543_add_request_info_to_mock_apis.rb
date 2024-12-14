class AddRequestInfoToMockApis < ActiveRecord::Migration[7.2]
  def change
    add_column :mock_apis, :request_body, :json
    add_column :mock_apis, :request_headers, :json
    add_column :mock_apis, :request_params, :json
  end
end
