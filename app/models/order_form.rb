class OrderForm
  include ActiveModel::Model
  attr_accessor  :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :prefectures_id, numericality: { other_than: 1 }  
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :municipality
    validates :address
    validates :phone_number, length: {maximum: 11}
  end

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number,order_id: order.id)
  end
end