require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザーの新規登録' do
    context '新規登録できるとき' do
      it "nickname,email,password,password_confirmation,familyname,firstname,familyname_kana,firstname_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが6文字以上であれば登録できる" do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "familynameが空では登録できない" do
        @user.familyname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname can't be blank")
      end
      it "firstnameが空では登録できない" do
        @user.firstname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it "familyname_kanaが空では登録できない" do
        @user.familyname_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname kana can't be blank")
      end
      it "firstname_kanaが空では登録できない" do
        @user.firstname_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが全角では登録できない" do
        @user.password = "ああああああ"
        @user.password_confirmation = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input half-size characters.")
      end
      it "familynameとfirstnameが半角では登録できない" do
        @user.familyname = "yamada"
        @user.firstname = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname is invalid. Input full-width characters.", "Firstname is invalid. Input full-width characters.")
      end
      it "familyname_kanaとfirstname_kanaが漢字では登録できない" do
        @user.familyname_kana = "山田"
        @user.firstname_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname kana is invalid. Input full-width katakana characters.","Firstname kana is invalid. Input full-width katakana characters.")
      end
      it "emailに@がついていないと登録できない" do
        @user.email = "samplegmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが英語のみでは入力できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input half-size characters.")
      end
      it "passwordが数字のみでは入力できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input half-size characters.")
      end
    end
  end
end
