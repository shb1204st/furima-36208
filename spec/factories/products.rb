FactoryBot.define do
  factory :product do
    product_name        { 'a' }
    product_explain     { Faker::Lorem.sentence }
    category_id         { 2 }
    product_statu_id { 2 }
    cost_id             { 2 }
    seller_place_id     { 1 }
    need_day_id { 2 }
    price               { Random.rand(300..9_999_999) }
    association         :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
