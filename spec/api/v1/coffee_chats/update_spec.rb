require 'rails_helper'

RSpec.describe "coffee_chats#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/coffee_chats/#{coffee_chat.id}", payload
  end

  describe 'basic update' do
    let!(:coffee_chat) { create(:coffee_chat) }

    let(:payload) do
      {
        data: {
          id: coffee_chat.id.to_s,
          type: 'coffee_chats',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(CoffeeChatResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { coffee_chat.reload.attributes }
    end
  end
end
