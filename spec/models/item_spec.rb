require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '登録できるとき' do
     it "name,text,category_id,condition_id,delivery_fee_id,prefectures_id,delivery_days_id,priceが存在すれば登録できる" do
       expect(@item).to be_valid
     end
    end
    context '登録できないとき' do
      it "nameが空では登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "textが空では登録できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "categoryが空では登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "conditionが空では登録できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it "delivery_feeが空では登録できない" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee is not a number")
      end
      it "prefecturesが空では登録できない" do
        @item.prefectures_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures is not a number")
      end
      it "delivery_daysが空では登録できない" do
        @item.delivery_days_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days is not a number")
      end
      it "priceが空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが全角では登録できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-size characters.")
      end
      it "priceが半角英数字混合では登録できない" do
        @item.price = "3a00"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-size characters.")
      end
      it "priceが半角英字のみでは登録できない" do
        @item.price = "aaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-size characters.")
      end
      it "priceが299円以下では登録できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが10000000円以上では登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "categoryのidが1が選択されている場合は登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "conditionのidが1が選択されている場合は登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "delivery_feeのidが1が選択されている場合は登録できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it "prefecturesのidが1が選択されている場合は登録できない" do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures must be other than 1")
      end
      it "delivery_daysのidが1が選択されている場合は登録できない" do
        @item.delivery_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days must be other than 1")
      end
      it "userが紐付いていないと保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
