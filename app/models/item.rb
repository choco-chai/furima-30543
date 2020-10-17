class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :state
  belongs_to_active_hash :genre
  belongs_to_active_hash :item_status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_days

  belongs_to :user
  has_one :purchase
  has_one_attached :image
  
  validates :title, :text, :price, :genre, :item_status, :delivery_charge, :delivery_days, presence: true
  validates :genre_id, numericality: { other_than: 1 }
end
