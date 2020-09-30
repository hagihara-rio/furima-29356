class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_item, only:[:show, :edit, :update, :destroy]

  def index

    @item = Item.all.order('created_at DESC')
    @order = Order.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new 
    end
  end

  def show
    #  :set_item 済
    @order = Order.new
  end

  def edit
    #  :set_item 済
  end

  def update
    #  :set_item 済
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    #  :set_item 済
    if @item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:itemname, :detail, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end