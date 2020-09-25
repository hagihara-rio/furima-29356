class OrdersController < ApplicationController

  def new
  end

  def index
#   @item = Item.find(params[:item_id])
   @order = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
  end

  private

  def order_params
    params.permit(:phone_number, :building_name, :address, :city, :prefectures, :postal_code).merge(user_id: current_user.id)
  end

end