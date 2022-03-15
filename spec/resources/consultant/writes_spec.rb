require 'rails_helper'

RSpec.describe ConsultantResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'consultants',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ConsultantResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Consultant.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:consultant) { create(:consultant) }

    let(:payload) do
      {
        data: {
          id: consultant.id.to_s,
          type: 'consultants',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ConsultantResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { consultant.reload.updated_at }
      # .and change { consultant.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:consultant) { create(:consultant) }

    let(:instance) do
      ConsultantResource.find(id: consultant.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Consultant.count }.by(-1)
    end
  end
end
