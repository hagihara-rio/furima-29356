class ItemsController < ApplicationController


  before_action :authenticate_user!, except:[:index]


  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end


  private


  def item_params
    params.require(:item).permit(:itemname, :detail, :category, :condition, :shipping_fee, :shipping_area, :shipping_days, :price, :image).merge(user_id: current_user.id)
  end


end