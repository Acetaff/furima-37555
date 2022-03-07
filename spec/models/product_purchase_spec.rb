require 'rails_helper'

RSpec.describe ProductPurchase, type: :model do
  before do
    @product_purchase = FactoryBot.build(:product_purchase)
  end

  describe '購入情報の保存' do
    
    context '保存できる場合' do
      it 'userとitemの情報が紐づいていれば保存できる' do
        expect(@product_purchase).to be_valid
      end
    end

    context '保存できない場合' do
      it 'user情報が紐づいていなければ保存できない' do
        @product_purchase.user = nil
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("User must exist")
      end
      it 'item情報が紐づいていなければ保存できない' do
        @product_purchase.item = nil
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("Item must exist")
      end
    end
  end
end