class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]

  def index
    @item = Item.all.order('created_at DESC')
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

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destoy
    if @item.destroy
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:itemname, :detail, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

end