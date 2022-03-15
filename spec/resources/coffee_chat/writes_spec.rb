require "rails_helper"

RSpec.describe CoffeeChatResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "coffee_chats",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CoffeeChatResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { CoffeeChat.count }.by(1)
    end
  end

  describe "updating" do
    let!(:coffee_chat) { create(:coffee_chat) }

    let(:payload) do
      {
        data: {
          id: coffee_chat.id.to_s,
          type: "coffee_chats",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CoffeeChatResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { coffee_chat.reload.updated_at }
      # .and change { coffee_chat.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:coffee_chat) { create(:coffee_chat) }

    let(:instance) do
      CoffeeChatResource.find(id: coffee_chat.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { CoffeeChat.count }.by(-1)
    end
  end
end
