class ItemsController < ApplicationController


  before_action :authenticate_user!, except:[:index]


  def index
  end

  def new
    @item = Item.new
  end


#  データの保存に成功したら「root_path」へ、
#  保存に失敗したら再度「new」のビューファイルがレンダリング
#  されるように条件分岐しています。

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private


  def item_params
    params.require(:item).permit(:itemname, :detail, :category, :condition, :shipping_fee, :shipping_area, :shipping_days, :price, :image).merge(user_id: current_user.id)
  end


end