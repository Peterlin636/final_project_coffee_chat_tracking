require 'rails_helper'

RSpec.describe CoffeeChat, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:consultant) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
