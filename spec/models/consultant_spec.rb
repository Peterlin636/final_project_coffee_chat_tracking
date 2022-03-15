require 'rails_helper'

RSpec.describe Consultant, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:coffee_chats) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
