class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    zenkaku = /\A([ぁ-んァ-ン一-龥]|ー)+\z/
    zenkakukana = /\A([ァ-ン]|ー)+\z/
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :nickname
    validates :family_name, format: { with: zenkaku }
    validates :first_name, format: { with: zenkaku }
    validates :family_name_kana, format: { with: zenkakukana }
    validates :first_name_kana, format: { with: zenkakukana }
    validates :birth_date
  end

  has_many :items
  has_many :purchases
end
