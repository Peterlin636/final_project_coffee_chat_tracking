require "rails_helper"

RSpec.describe Company, type: :model do
  describe "Direct Associations" do
    it { should have_many(:consultants) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
