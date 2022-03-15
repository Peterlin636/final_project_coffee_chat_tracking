require 'rails_helper'

RSpec.describe "coffee_chats#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/coffee_chats", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'coffee_chats',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(CoffeeChatResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { CoffeeChat.count }.by(1)
    end
  end
end
