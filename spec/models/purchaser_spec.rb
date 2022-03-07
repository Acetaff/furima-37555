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
      it '建物名が空でも保存できる' do
        @purchaser.building_name = ''
        expect(@purchaser).to be_valid
      end
    end

  end
end
