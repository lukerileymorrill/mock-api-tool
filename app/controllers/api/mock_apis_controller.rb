class Api::MockApisController < ApplicationController
  before_action :set_mock_api, only: [:show, :update, :destroy]

  # GET /api/mock_apis
  def index
    mock_apis = MockApi.includes(:mock_api_responses).all
    render json: mock_apis.as_json(include: :mock_api_responses)
  end

  # POST /api/mock_apis
  def create
    mock_api = MockApi.new(mock_api_params)

    if mock_api.save
      render json: mock_api, status: :created
    else
      render json: { errors: mock_api.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /api/mock_apis/:id
  def show
    render json: @mock_api.as_json(include: :mock_api_responses)
  end

  # PUT /api/mock_apis/:id
  def update
    if @mock_api.update(mock_api_params)
      render json: @mock_api
    else
      render json: { errors: @mock_api.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/mock_apis/:id
  def destroy
    @mock_api.destroy
    head :no_content
  end

  private

  def set_mock_api
    @mock_api = MockApi.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Mock API not found' }, status: :not_found
  end

  def mock_api_params
    params.require(:mock_api).permit(:endpoint, :method, mock_api_responses_attributes: [:id, :status_code, :response_body, :response_headers, :_destroy])
  end
end
