class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :nickname, presence: true
  validates :family_name, presence: true, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/}
  validates :first_name, presence: true, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/}
  validates :family_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/}
  validates :first_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/}
  validates :birth_date, presence: true
end
