class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_statu
  belongs_to :cost
  belongs_to :seller_place
  belongs_to :need_day

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_explain
  end
    
  validates :price, presence: true, 
             numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
             format: { with: /\A[0-9]+\z/ }


  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :product_status_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :cost_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :seller_place_id, numericality: { other_than: 0 , message: "can't be blank" }
  validates :need_days_id, numericality: { other_than: 1 , message: "can't be blank" }

  belongs_to :user
  has_one_attached :image

end
