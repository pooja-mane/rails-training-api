FactoryBot.define do
  factory :product, class: Product do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    category { 'category1' }
    price { 100 }
    release_date { Date.today }
  end
end
