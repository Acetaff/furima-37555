FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password { 'abc123' }
    password_confirmation {password}
    last_name { 'てすと' }
    first_name { 'まん' }
    last_kana { 'テスト' }
    first_kana { 'マン' }
    birthday {Faker::Date.birthday}
  end
end