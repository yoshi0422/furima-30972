class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def new
    @items = Item.new
  end
  def create
    @ites = Item.new(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :image).merge(user_id: current_user.id)
  end
end
