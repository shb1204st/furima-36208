FactoryBot.define do
  factory :buy_address do
    post_code           { '111-1111' }
    seller_place_id     { 1 }
    city                { '大阪市' }
    address             { '1-1' }
    build_name          { '大阪ハイツ' }
    phone_num           { '09011111111' }
    token               { 'tok_abcdefghijk00000000000000000' }
  end
end
