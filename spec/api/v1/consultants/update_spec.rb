require "rails_helper"

RSpec.describe "consultants#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/consultants/#{consultant.id}", payload
  end

  describe "basic update" do
    let!(:consultant) { create(:consultant) }

    let(:payload) do
      {
        data: {
          id: consultant.id.to_s,
          type: "consultants",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ConsultantResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { consultant.reload.attributes }
    end
  end
end
