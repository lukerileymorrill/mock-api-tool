class MockApi < ApplicationRecord
  # Associations
  has_many :mock_api_responses, dependent: :destroy

  # Validations
  validates :endpoint, presence: true, uniqueness: { scope: :method }
  validates :method, presence: true, inclusion: { in: %w[GET POST PUT PATCH DELETE] }

  # Nested attributes for handling responses in a single request
  accepts_nested_attributes_for :mock_api_responses, allow_destroy: true
end
