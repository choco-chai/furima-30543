class Purchase < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :user
  has_one :address
end
