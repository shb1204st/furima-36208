class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_statu
  belongs_to :cost
  belongs_to :seller_place
  belongs_to :need_day

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_explain
  end

  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1, message: "を選択してください" } do
    validates :category_id
    validates :product_statu_id
    validates :cost_id
    validates :need_day_id
  end

  validates :seller_place_id, numericality: { other_than: 0, message: "を選択してください" }

  belongs_to :user
  has_one    :buy
  has_one_attached :image
end
