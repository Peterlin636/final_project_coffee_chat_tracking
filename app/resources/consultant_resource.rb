class ConsultantResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :company_id, :integer
  attribute :title, :string
  attribute :office, :string
  attribute :phone_number, :string

  # Direct associations

  has_many   :coffee_chats

  # Indirect associations

end
