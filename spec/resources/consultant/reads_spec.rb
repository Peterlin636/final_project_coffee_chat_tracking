require "rails_helper"

RSpec.describe ConsultantResource, type: :resource do
  describe "serialization" do
    let!(:consultant) { create(:consultant) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(consultant.id)
      expect(data.jsonapi_type).to eq("consultants")
    end
  end

  describe "filtering" do
    let!(:consultant1) { create(:consultant) }
    let!(:consultant2) { create(:consultant) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: consultant2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([consultant2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:consultant1) { create(:consultant) }
      let!(:consultant2) { create(:consultant) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      consultant1.id,
                                      consultant2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      consultant2.id,
                                      consultant1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
