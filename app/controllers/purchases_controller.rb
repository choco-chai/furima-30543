class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user || @item.purchase
      redirect_to root_path
    end
  end
 
  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    @item = Item.find(params[:item_id])
     if @purchase_address.valid?
       pay_item
       @purchase_address.save
       redirect_to root_path
     else
       render 'index'
     end
  end
 
  private

  def purchase_params
   params.require(:purchase_address).permit(:postal_code, :state_id, :city, :house_number, :building, :tel, :purchase_id).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.price,
    card: purchase_params[:token],
    currency: 'jpy'
    )
  end
end
