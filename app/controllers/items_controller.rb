class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def index
    @items = Item.all.order("created_at DESC")
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
  end

  def edit
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end
  
  def update
    return redirect_to root_path if current_user.id != @item.user_id
      if @item.update(item_params)
        redirect_to item_path
      else
        render :edit
      end
  end

  def destroy
    return redirect_to root_path if current_user.id != @item.user_id
      if @item.destroy
        redirect_to root_path
      end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :image, :category_id, :condition_id, :delivery_fee_id, :prefectures_id, :delivery_days_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
