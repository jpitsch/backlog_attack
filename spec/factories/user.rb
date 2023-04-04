FactoryBot.define do
  factory :user do
    user_name { Faker::Internet.username }
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
  end
end