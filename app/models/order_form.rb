class OrderAddress
  include ActiveModel::Model
  atter_accessor :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number

  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i ,message: "is invalid. Input half-size characters."}, length: {minimum: 6}
    validates :nickname
      with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/,message: "is invalid. Input full-width characters." } do
        validates :familyname
        validates :firstname
      end
      with_options format: { with: /\A[ァ-ヶー－]+\z/,message: "is invalid. Input full-width katakana characters." } do
        validates :familyname_kana
        validates :firstname_kana
      end
      with_options numericality: { other_than: 1 } do
        validates :prefectures_id 
      end
    validates :birthday
    validates :postal_code format: {with:　^\d{3}-\d{4}$}
    validates :municipality
    validates :address
    validates :phone_number format: {with: ^0\d{9,11}$}
  end

  def save
    user = User.create(familyname: familyname, firstname: firstname, familyname_kana: familyname_kana, firstname_kana: firstname_kana, email: email)
    Order.create(user_id: user.id,item_id: item.id)
    Address.create(postal_code: postal_code, prefectures: prefectures, municipality: manicipality, address: address, building_name: building_name, phone_number: phone_number,order_id: order.id)
    Item.create(name: name, text: text, category: category, condition: condition, delivery_fee: delivery_fee, prefectures: prefectures: prefectures, delivery_days: delivery_days, price: price, user_id: user.id)
  end

end