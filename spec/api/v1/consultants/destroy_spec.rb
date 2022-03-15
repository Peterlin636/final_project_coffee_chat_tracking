require 'rails_helper'

RSpec.describe "consultants#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/consultants/#{consultant.id}"
  end

  describe 'basic destroy' do
    let!(:consultant) { create(:consultant) }

    it 'updates the resource' do
      expect(ConsultantResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Consultant.count }.by(-1)
      expect { consultant.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
