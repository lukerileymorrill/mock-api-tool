class MockApiResponse < ApplicationRecord
  # Associations
  belongs_to :mock_api

  # Validations
  validates :status_code, presence: true, numericality: { only_integer: true }
  validates :response_body, presence: true
end
