class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/.freeze
  
  validates :password, format: { with: PASSWORD_REGEX, message: 'には半角英数を両方含む必要があります'}
  validates :nickname, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'には全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: {with: /\A[ァ-ヶ]+\z/, message: 'に全角カタカナを使用してください'} do
    validates :last_kana
    validates :first_kana
  end

  validates :birthday, presence: true
end
