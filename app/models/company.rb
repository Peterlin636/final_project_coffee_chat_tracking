class Company < ApplicationRecord
  # Direct associations

  has_many   :consultants,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end
end
