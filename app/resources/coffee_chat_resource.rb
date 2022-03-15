class CoffeeChatResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :location, :string
  attribute :consultant_id, :integer
  attribute :time, :string
  attribute :followup_email, :string
  attribute :goal_of_the_chat, :string

  # Direct associations

  belongs_to :consultant

  # Indirect associations
end
