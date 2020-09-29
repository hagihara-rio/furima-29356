class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create, :pay_item, :move_to_top, :move_to_top2]
  before_action :move_to_top, only:[:index]
  before_action :move_to_top2, only:[:index]


  def show
    @order = OrderAddress.new(order_params)
  end

  def index
    #  :set_item 済
    @order = OrderAddress.new(order_params)
  end

  def create
    #  :set_item 済
    @order = OrderAddress.new(order_params)
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
    #  :set_item 済
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]   # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,           # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_top
    #  :set_item 済
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def move_to_top2
    if Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

end

