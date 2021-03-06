class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if  @order_form.valid? 
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_order
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id || @item.order.present?
      redirect_to root_path
    end
  end

  def order_params
    params.permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :item_id).merge(user_id: current_user.id,token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
