FactoryBot.define do
  factory :order_form do
    postal_code  {"111-1111"}
    prefectures_id  {2}
    municipality  {"横浜市旭区"}
    address  {"瀬谷1-1"}
    building_name  {"ビル"}
    phone_number  {"09012345678"}
    token {"tok_abcdefg0000000000"}
    user_id {1}
    item_id {2}
  end
end
