class BuyAddress
  include ActiveModel::Model
  attr_accessor :post_code, :seller_place_id, :city, :address, :build_name, :phone_num, :user_id, :product_id, :token

  validates :seller_place_id, numericality: { other_than: 0, message: "を選択してください" }

  with_options presence: true do
    validates :user_id, :product_id, :city, :address, :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン（ー）を入れてください' }
    validates :phone_num, format: { with: /\A\d{10,11}\z/, message: 'を正しく入力してください' }
  end

  def save
    buy = Buy.create(user_id: user_id, product_id: product_id)
    Address.create(post_code: post_code, seller_place_id: seller_place_id, city: city, address: address, build_name: build_name,
                   phone_num: phone_num, buy_id: buy.id)
  end
end
