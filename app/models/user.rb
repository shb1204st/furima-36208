class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/ } do
    validates :kana_first_name
    validates :kana_last_name 
  end
  validates :email,              presence: true
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :nickname,           presence: true
  # validates :first_name,         presence: true
  # validates :last_name,          presence: true
  # validates :kana_first_name,    presence: true
  # validates :kana_last_name,     presence: true
  validates :birthday,           presence: true
  
end
