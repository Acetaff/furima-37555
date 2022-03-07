require 'rails_helper'

RSpec.describe Purchaser, type: :model do
  before do
    @purchaser = FactoryBot.build(:purchaser)
  end

  context '保存できない場合' do
    it 'user情報が紐づいていなければ保存できない' do

    end
    it 'item情報が紐づいていなければ保存できない' do

    end
    it 'post_codeが空では保存できない' do

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
