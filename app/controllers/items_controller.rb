class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.all
  end
  def new
    @items = Item.order("created_at DESC")
  end
  def create
    @ites = Item.new(item_params)
    @items.save
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :image, :category_id, :condition_id, :delivery_fee_id, :prefectures_id, :delivery_days_id).merge(user_id: current_user.id)
  end
end
