class Consultant < ApplicationRecord
  # Direct associations

  has_many   :coffee_chats,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    company.to_s
  end

end
