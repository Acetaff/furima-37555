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
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードには半角英数を両方含む必要があります", "パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードには半角英数を両方含む必要があります")
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードには半角英数を両方含む必要があります")
      end
      it 'passwordは６文字以上での入力でなければ登録できない' do
        @user.password = "test1"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください")
      end
      it 'passwordに全角文字を含むと登録できない' do
        @user.password = "てsuto123"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードには半角英数を両方含む必要があります")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください", "名字には全角文字を使用してください")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください", "名前には全角文字を使用してください")
      end
      it 'last_nameが全角入力でなければ登録できない' do
        @user.last_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("名字には全角文字を使用してください")
      end
      it 'first_nameが全角入力でなければ登録できない' do
        @user.first_name = "man"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前には全角文字を使用してください")
      end
      it 'last_kanaが空では登録できない' do
        @user.last_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（カナ）を入力してください", "名字（カナ）に全角カタカナを使用してください")
      end
      it 'first_kanaが空では登録できない' do
        @user.first_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください", "名前（カナ）に全角カタカナを使用してください")
      end
      it 'last_kanaは全角カタカナでなければ登録できない' do
        @user.last_kana = "てすと"
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（カナ）に全角カタカナを使用してください")
      end
      it 'first_kanaは全角カタカナでなければ登録できない' do
        @user.first_kana = "まん"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）に全角カタカナを使用してください")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end