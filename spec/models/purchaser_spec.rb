require 'rails_helper'

RSpec.describe Purchaser, type: :model do
  before do
    @purchaser = FactoryBot.build(:purchaser)
  end

  describe '配送先情報の保存' do
    
    context '保存できる場合' do
      it '必要な項目が正しく存在していれば保存できる' do
        expect(@purchaser).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @purchaser.building_name = ''
        expect(@purchaser).to be_valid
      end
    end

    context '保存できない' do
      it 'post_codeが空では保存できない' do
        @purchaser.post_code = ''
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが全角数字では保存できない' do
        
      end
      it 'post_codeが数字以外では保存できない' do
        
      end
      it '-（ハイフン）が必要な位置に入っていなければ保存できない' do
        
      end
      it 'prefecture_idが空では保存できない' do
        
      end
      it 'prefecture_idが１（初期値”ーー”）では保存できない' do
        
      end
      it 'municipalitiesが空では保存できない' do
        
      end
      it 'addressが空では保存できない' do
        
      end
      it 'phone_numが空では保存できない' do
        
      end
      it 'phone_numが全角数字では保存できない' do
        
      end
      it 'phone_numが数字以外では保存できない' do
        
      end
      it 'phone_numが１０桁未満では保存できない' do
        
      end
      it 'phone_numが１２桁以上では保存できない' do
        
      end
    end

  end
end
