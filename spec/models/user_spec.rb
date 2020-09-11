require 'rails_helper'


RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do

    context '新規登録がうまくいくとき' do
      it "nickname,email,encrypted_password,last_name,first_name,last_name_kana,first_name_kana,birthdate,が存在すれば登録できる" do

      end
      it "パスワードは6文字以上であれば登録できる" do

      end
    end

    context '新規登録がうまくいかないとき' do
c
      it "メールアドレスが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "メールアドレスに@を含むまなければ登録できない" do

      end
      it "重複したメールアドレスが存在する場合登録できない" do

      end
      it "パスワードが空では登録できない" do

      end
      it "passwordが5文字以下であれば登録できない" do

      end
      it "パスワードが半角英数字混合でないと登録できない" do

      end
      it "パスワードが存在してもパスワード_confirmationが空では登録できない" do

      end
      it "ユーザー本名(苗字)が空だと登録できない" do

      end
      it "ユーザー本名(下の名前)が空だと登録できない" do

      end
      it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力しなければ登録できない" do

      end
      it "カナのユーザー本名(苗字)が空だと登録できない" do

      end
      it "カナのユーザー本名(苗字)が空だと登録できない" do

      end
      it "カナのユーザー本名は全角（カタカナ）で入力しなければ登録できない" do

      end
      it "生年月日が空だと登録できない" do

      end
    end


  end
end
