require "rails_helper"

RSpec.describe "coffee_chats#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/coffee_chats", params: params
  end

  describe "basic fetch" do
    let!(:coffee_chat1) { create(:coffee_chat) }
    let!(:coffee_chat2) { create(:coffee_chat) }

    it "works" do
      expect(CoffeeChatResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["coffee_chats"])
      expect(d.map(&:id)).to match_array([coffee_chat1.id, coffee_chat2.id])
    end
  end
end
