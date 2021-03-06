class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :state
  belongs_to_active_hash :genre
  belongs_to_active_hash :item_status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_days

  belongs_to :user
  has_one :purchase
  has_many_attached :images

  validates :title, :text, :images, :state, :genre, :item_status, :delivery_charge, :delivery_days, presence: true
  validates :price, numericality: { greater_than: 299, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }, presence: true
  validates :state_id, :genre_id, :item_status_id, :delivery_charge_id, :delivery_days_id, numericality: { other_than: 1 }
end
