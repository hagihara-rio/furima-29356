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

      it "ログインしていないユーザーは購入ページに遷移しようとしても、ログインページにしか遷移できないこと" do
        @order_address.user = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("")
      end
      it "出品者はURLを直接入力して購入ページに遷移しようとしても、トップページにしか遷移できないこと" do
        @order_address.user = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("")
      end
      it "URLを直接入力して購入済み商品の購入ページへ遷移しようとしても、トップページにしか遷移できないこと" do
        @order_address.user = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("")
      end
      it "クレジットカード決済ができないと購入できないこと" do
        @order_address.user = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("")
      end
      it "クレジットカードの情報は購入の都度入力させないと購入できないこと" do
        @order_address.user = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("")
      end
      it "クレジットカード情報は必須で、正しいクレジットカードの情報で無いときは決済できないこと" do
        @order_address.user = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("")
      end
      it "配送先の住所情報は購入の都度入力させないと購入できないこと" do
        @order_address.user = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("")
      end
      it "郵便番号・都道府県・市区町村・番地・電話番号が存在しないと購入できないこと" do
        @order_address.user = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("")
      end
      it "郵便番号にハイフンが存在しないと購入できないこと（123-4567となる）" do
        @order_address.user = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("")
      end
      it "電話番号にはハイフンは不要で、11桁以内でないと購入できないこと" do
        @order_address.user = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("")
      end
      it "購入が完了したら、トップページまたは購入完了ページにしか遷移できないこと" do
        @order_address.user = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("")
      end
      it "購入した商品は、再度購入できない状態になっていること" do
        @order_address.user = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("")
      end
      it "U" do
        @order_address.user = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("")
      end

    end
  end

 end
end