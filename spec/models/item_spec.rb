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
        @item.category = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "conditionが空では登録できない" do
        @item.condition = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "delivery_feeが空では登録できない" do
        @item.delivery_fee = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery_fee can't be blank")
      end
      it "prefecturesが空では登録できない" do
        @item.prefectures = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures can't be blank")
      end
      it "delivery_daysが空では登録できない" do
        @item.delivery_days = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery_days can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが全角では登録できない" do
        @item.price = "１００００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-size characters.")
      end
      it "userが紐付いていないと保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
