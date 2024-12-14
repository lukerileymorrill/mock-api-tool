class MockApisController < ApplicationController
  # Catch all requests dynamically
  def handle_request
    # Find the MockApi by endpoint and method
    mock_api = MockApi.find_by(endpoint: request.path, method: request.method)

    if mock_api
      # Get the requested status code from a query parameter, fallback to 200
      status_code = params[:status_code].to_i || 200

      # Find the appropriate response for the requested status code
      mock_response = mock_api.mock_api_responses.find_by(status_code: status_code)

      if mock_response
        # Return the mock response
        render json: mock_response.response_body, 
               status: mock_response.status_code, 
               headers: mock_response.response_headers || {}
      else
        # If no matching status code, return a default 404
        render json: { error: "Response not defined for status code #{status_code}" }, status: 404
      end
    else
      # If no matching endpoint, return 404
      render json: { error: "Mock API not found" }, status: 404
    end
  end
end
