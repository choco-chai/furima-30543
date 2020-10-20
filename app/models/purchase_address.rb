class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :house_number, :city, :building, :tel, :state_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :tel, format: { with: /\A\d{11}\z/ }
    validates :city, :house_number, :state_id
  end

  def save
    user = User.create
    item = Item.create
    Address.create(postal_code: postal_code, house_number: house_number, city: city, building: building, tel: tel, state_id: state_id, item_id: item_id)
    Purchase.create(item_id: item_id, user_id: user_id)
  end
end
