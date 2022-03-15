require 'rails_helper'

RSpec.describe CoffeeChatResource, type: :resource do
  describe 'serialization' do
    let!(:coffee_chat) { create(:coffee_chat) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(coffee_chat.id)
      expect(data.jsonapi_type).to eq('coffee_chats')
    end
  end

  describe 'filtering' do
    let!(:coffee_chat1) { create(:coffee_chat) }
    let!(:coffee_chat2) { create(:coffee_chat) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: coffee_chat2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([coffee_chat2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:coffee_chat1) { create(:coffee_chat) }
      let!(:coffee_chat2) { create(:coffee_chat) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            coffee_chat1.id,
            coffee_chat2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            coffee_chat2.id,
            coffee_chat1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
