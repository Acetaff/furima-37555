require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
  end

  describe '購入データと配送先データの保存' do
    
    context '保存できる場合' do
      it '全ての項目が正しく存在していれば保存できる' do
        expect(@order).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @order.building_name = ""
        expect(@order).to be_valid
      end
    end
  end
end