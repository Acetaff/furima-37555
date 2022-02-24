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
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは英数混合でなければ登録できない' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角英数を両方含む必要があります")
      end
      it 'passwordは６文字以上での入力でなければ登録できない' do
        @user.password = "test1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'last_nameとfirst_nameがどちらも存在しなければ登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name には全角文字を使用してください")
      end
      it 'last_nameとfirst_nameはどちらも全角入力でなければ登録できない' do
        @user.last_name = "testman"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name には全角文字を使用してください")
      end
      it 'last_kanaとfirst_kanaがどちらも存在しなければ登録できない' do
        @user.last_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank", "Last kana に全角カタカナを使用してください")
      end
      it 'last_kanaとfirst_kanaはどちらも全角カタカナでなければ登録できない' do
        @user.last_kana = "てすと"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana に全角カタカナを使用してください")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end