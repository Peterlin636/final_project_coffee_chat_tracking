require "rails_helper"

RSpec.describe "consultants#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/consultants", params: params
  end

  describe "basic fetch" do
    let!(:consultant1) { create(:consultant) }
    let!(:consultant2) { create(:consultant) }

    it "works" do
      expect(ConsultantResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["consultants"])
      expect(d.map(&:id)).to match_array([consultant1.id, consultant2.id])
    end
  end
end
