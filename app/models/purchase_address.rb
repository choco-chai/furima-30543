class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :house_number, :city, :building, :tel, :state_id, :item_id, :user_id, :purchase_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'はハイフンが必要です' }
    validates :tel, format: { with: /\A\d{,11}\z/, message: 'は11文字以内の数字のみ入力できます' }
    validates :state_id, numericality: { other_than: 1 }
    validates :city, :house_number, :token
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, house_number: house_number, city: city, building: building, tel: tel, state_id: state_id, purchase_id: purchase.id)
  end
end
