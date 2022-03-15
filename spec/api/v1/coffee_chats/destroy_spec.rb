require 'rails_helper'

RSpec.describe "coffee_chats#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/coffee_chats/#{coffee_chat.id}"
  end

  describe 'basic destroy' do
    let!(:coffee_chat) { create(:coffee_chat) }

    it 'updates the resource' do
      expect(CoffeeChatResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { CoffeeChat.count }.by(-1)
      expect { coffee_chat.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
