class OrdersController < ApplicationController
  before_action :authenticate_user!
  #before_action :move_to_top, except:[:index, :show]

  def new
  end

  def index
   @item = Item.find(params[:item_id])
   @order = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
    #binding.pry
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private

  def order_params
    params.permit(:token, :item_id, :phone_number, :building_name, :address, :city, :prefecture_id, :postal_code).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_8acf5c210875ce0e9b6af5b0"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      #amount: order_params[:price],  # 商品の値段
      amount: @item.price,           # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_to_top
    @item = Item.find(params[:item_id])
    if current_user.id != @item
       redirect_to root_path 
    end
  end

end