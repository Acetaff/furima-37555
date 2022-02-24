require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
    
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "全ての項目が正しく存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do

    end
  end
end