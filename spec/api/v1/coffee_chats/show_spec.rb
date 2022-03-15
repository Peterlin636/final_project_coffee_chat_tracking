require "rails_helper"

RSpec.describe "coffee_chats#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/coffee_chats/#{coffee_chat.id}", params: params
  end

  describe "basic fetch" do
    let!(:coffee_chat) { create(:coffee_chat) }

    it "works" do
      expect(CoffeeChatResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("coffee_chats")
      expect(d.id).to eq(coffee_chat.id)
    end
  end
end
