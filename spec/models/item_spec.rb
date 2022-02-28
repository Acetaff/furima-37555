require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '出品できる場合'
      it '全ての項目が正しく存在していれば出品できる' do
        expect(@item).to be_valid
      end
    end
end
