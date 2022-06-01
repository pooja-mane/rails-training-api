require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { create(:product, price: 500) }

  describe 'validations' do
    context 'when name contains data' do
      before do
        @product = build(:product, name: 'Product 1')
      end

      it 'should validate data with no erros' do
        @product.save
        expect(@product.errors.full_messages).to be_empty
      end
    end

    context 'when name does not contain value' do
      before do
        @product = build(:product, name: '')
      end

      it 'should validate data with errors' do
        @product.save
        expect(@product.errors.full_messages).to eq(["Name can't be blank"])
      end
    end
  end







  describe '#formated_release_date' do
    it 'should return formated release date' do
      expect(product.formated_release_date).to eq(Date.today.strftime('%d %b %Y'))
    end
  end

  describe '#fomated_price' do
    it 'should return formated release date' do
      expect(product.fomated_price).to eq("Rs. 500.0")
    end
  end
end
