class CompanyResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :industry, :string
  attribute :website, :string

  # Direct associations

  has_many :consultants

  # Indirect associations
end
