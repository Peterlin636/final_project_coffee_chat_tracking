class CoffeeChat < ApplicationRecord
  # Direct associations

  belongs_to :consultant

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    location
  end
end
