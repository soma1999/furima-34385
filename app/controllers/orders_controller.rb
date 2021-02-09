class OrdersController < ApplicationController

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:user_order).permit(
      :postal_code,
      :prefecture_id,
      :municipality,
      :address,
      :building_name,
      :phone_number
    ).merge(user_id: current_user.id,token: params[:token],item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    @item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end
end
