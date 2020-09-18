require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end


  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do

      it "必要項目全てが存在すれば登録できること" do
        expect(@item).to be_valid
      end

    context '商品出品がうまくいかないとき' do

      it "ログインしているユーザーだけが、出品ページへ遷移できること" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it "画像は1枚必須であること(ActiveStorageを使用すること)" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が必須であること" do
        @item.itemname = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Itemname can't be blank")
      end
      it "商品名が40文字以上の時登録できないこと" do
        @item.itemname = "あ" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Itemname is too long (maximum is 40 characters)")
      end
      it "商品の説明が1000文字以上の時登録できないこと" do
        @item.detail = "あ" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail is too long (maximum is 1000 characters)")
      end
      it "商品の説明が必須であること" do
        @item.detail = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it "カテゴリーの情報が1では登録できないこと" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "カテゴリーの情報が必須であること" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態についての情報が1では登録できないこと" do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "商品の状態についての情報が必須であること" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "配送料の負担についての情報が1では登録できないこと" do
        @item.shipping_fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
      end
      it "配送料の負担についての情報が必須であること" do
        @item.shipping_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it "発送元の地域についての情報が1では登録できないこと" do
        @item.shipping_area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it "発送元の地域についての情報が必須であること" do
        @item.shipping_area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it "発送までの日数についての情報が1では登録できないこと" do
        @item.shipping_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end
      it "発送までの日数についての情報が必須であること" do
        @item.shipping_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it "価格についての情報が必須であること" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の範囲が、¥300以下だと登録できないこと" do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格の範囲が、¥9,999,999以上だと登録できないこと" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "販売価格は半角数字のみ入力可能であること" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end

 end
end
