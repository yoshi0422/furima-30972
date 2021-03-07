require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id,item_id: @item.id)
    sleep(2)
  end

  describe '商品購入機能' do
    context '登録できるとき' do
     it "postal_code,prefectures_id,municipality,address,phone_number,token,user_id,item_idが存在すれば登録できる" do
       expect(@order_form).to be_valid
     end
     it "building_nameが空でも登録できる" do
      @order_form.building_name  = ""
      expect(@order_form).to be_valid
     end
    end
    context '登録できないとき' do
      it "postal_codeが空では登録できない" do
        @order_form.postal_code = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it "prefecturesが空では登録できない" do
        @order_form.prefectures_id = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefectures is not a number")
      end
      it "municipalityが空では登録できない" do
        @order_form.municipality = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it "addressが空では登録できない" do
        @order_form.address = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空では登録できない" do
        @order_form.phone_number = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it "user_idが空では登録できない" do
        @order_form.user_id = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では登録できない" do
        @order_form.user_id = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it "prefecturesのidが1が選択されている場合は登録できない" do
        @order_form.prefectures_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefectures must be other than 1")
      end
      it "phone_numberが12桁以上では登録できない" do
        @order_form.phone_number = '000000000000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "postal_codeはハイフンがないと登録できない" do
        @order_form.postal_code = '0000000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end
      it "phone_numberはハイフンがあると登録できない" do
        @order_form.phone_number = '080-1111-1111'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input half-size characters.")
      end
      it "phone_numberが英数字混合では登録できない" do
        @order_form.phone_number = "0901a1a1a1a"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input half-size characters.")
      end
      it "tokenが空では登録できない" do
        @order_form.token = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
