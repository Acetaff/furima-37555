require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    sleep 0.1
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

    context '保存できない場合'do
      it 'user情報が紐づいていなければ保存できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item情報が紐づいていなければ保存できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_codeが空では保存できない' do
        @order.post_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが全角数字では保存できない' do
        @order.post_code = "１２３-４５６７"
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが数字以外では保存できない' do
        @order.post_code = "tes-test"
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '-（ハイフン）が必要な位置に入っていなければ保存できない' do
        @order.post_code = 1234567
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空では保存できない' do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが１（初期値”ーー”）では保存できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空では保存できない' do
        @order.municipalities = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空では保存できない' do
        @order.address = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numが空では保存できない' do
        @order.phone_num = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_numが全角数字では保存できない' do
        @order.phone_num = "００００００００００"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone num には１０桁以上・11桁以内の半角数字を入力して下さい")
      end
      it 'phone_numが数字以外では保存できない' do
        @order.phone_num = "testmanman"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone num には１０桁以上・11桁以内の半角数字を入力して下さい")
      end
      it 'phone_numが１０桁未満では保存できない' do
        @order.phone_num = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone num には１０桁以上・11桁以内の半角数字を入力して下さい")
      end
      it 'phone_numが１２桁以上では保存できない' do
        @order.phone_num = 000000000000
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone num には１０桁以上・11桁以内の半角数字を入力して下さい")
      end
    end
  end
end