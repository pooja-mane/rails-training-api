FactoryBot.define do
  factory :user, class: User do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { 'josh123' }
  end
end
