class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角の漢字もしくはひらがなもしくはカタカナで入力してください" } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "は全角のカタカナで入力してください" } do
    validates :kana_first_name
    validates :kana_last_name
  end
  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "は半角英数字で入力してください" }

  has_many  :products
  has_many  :buys
end
