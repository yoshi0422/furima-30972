class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    @item = Item.find(params[:item_id])
    if  @order_form.valid? 
      @order_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end
end
