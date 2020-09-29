require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end


  describe '商品購入機能' do


    context '商品購入がうまくいくとき' do

      it "必要項目全てが存在すれば登録できること" do
        expect(@order_address).to be_valid
      end


    context '商品購入がうまくいかないとき' do

      it "クレジットカード決済ができないと購入できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が存在しないと購入できないこと" do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "都道府県が存在しないと購入できないこと" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "市区町村が存在しないと購入できないこと" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "番地が存在しないと購入できないこと" do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が存在しないと購入できないこと" do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "郵便番号にハイフンが存在しないと購入できないこと（123-4567となる）" do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
      it "電話番号にハイフンを使用すると購入できないこと" do
        @order_address.phone_number = "090-123-456"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is not a number")
      end
      it "電話番号は11桁以内でないと購入できないこと" do
        @order_address.phone_number = "090123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end

    end
  end
end