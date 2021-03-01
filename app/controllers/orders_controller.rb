class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    Order.create(order_params)
  end

  private

  def order_params
    params.requre(:order).permit(:number, :exp_month, :exp_year, :cvc, :postal_code, :prefectures_id, :manicipality, :address, :building_name, :phone_number)
  end
end
