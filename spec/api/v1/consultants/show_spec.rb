require 'rails_helper'

RSpec.describe "consultants#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/consultants/#{consultant.id}", params: params
  end

  describe 'basic fetch' do
    let!(:consultant) { create(:consultant) }

    it 'works' do
      expect(ConsultantResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('consultants')
      expect(d.id).to eq(consultant.id)
    end
  end
end
