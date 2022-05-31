FactoryBot.define do
  factory :product, class: Product do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    category { 'category1' }
  end
end
