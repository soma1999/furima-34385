class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create] 
  before_action :set_item, only: [:edit, :show, :update, :ensure_current_user, :destroy,:forbid_edit]
  before_action :ensure_current_user, only: [:edit, :update, :destroy]
  before_action :forbid_edit, only: [:edit]
  
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render  :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if  @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :title, 
      :description, 
      :category_id, 
      :item_state_id, 
      :shipping_fee_id , 
      :prefecture_id, 
      :shipping_day_id , 
      :price,
      :image
    ).merge(user_id: current_user.id)
  end

  def ensure_current_user
    unless user_signed_in? && current_user.id == @item.user_id 
      redirect_to new_user_session_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def forbid_edit
    if @item.order != nil
      redirect_to new_user_session_path
    end
  end
end
