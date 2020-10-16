require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end
  
    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "全ての値が正しく入力されていれば登録できる" do
          expect(@user).to be_valid
        end
      end
  
      context '新規登録がうまくいかないとき' do
        it "nicknameが空だと登録できない" do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "emailが空では登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "emailが存在しても@を含んでいなければ登録できない" do
          @user.email = "sample.sample.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it "重複したemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it "passwordが空では登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "passwordが5文字以下であれば登録できない" do
          @user.password = "aa000"
          @user.password_confirmation = "aa000"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it "passwordが6文字以上でも半角英字のみでは登録できない" do
          @user.password = "aaaaaa"
          @user.password_confirmation = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it "passwordが6文字以上でも半角数字のみでは登録できない" do
          @user.password = "111111"
          @user.password_confirmation = "111111"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it "passwordが存在してもpassword_confirmationが空では登録できない" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "passwordとpassword_confirmationが一致しなければ登録できない" do
          @user.password = "aaa000"
          @user.password_confirmation = "aaa009"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "family_nameが空では登録できない" do
          @user.family_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end
        it "first_nameが空では登録できない" do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it "family_nameが半角では登録できない" do
          @user.family_name = "ﾔﾏﾀﾞ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name is invalid")
        end
        it "first_nameが半角では登録できない" do
          @user.first_name = "ﾀﾛｳ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end
        it "family_name_kanaが空では登録できない" do
          @user.family_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana can't be blank")
        end
        it "first_name_kanaが空では登録できない" do
          @user.first_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it "family_name_kanaが半角では登録できない" do
          @user.family_name_kana = "ﾔﾏﾀﾞ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana is invalid")
        end
        it "first_name_kanaが半角では登録できない" do
          @user.first_name_kana = "ﾀﾛｳ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
        it "family_name_kanaが全角でも漢字、ひらがなでは登録できない" do
          @user.family_name_kana = "山田"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana is invalid")
        end
        it "first_name_kanaが全角でも漢字では登録できない" do
          @user.first_name_kana = "太郎"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
        it "family_name_kanaが全角でもひらがなでは登録できない" do
          @user.family_name_kana = "やまだ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana is invalid")
        end
        it "first_name_kanaが全角でもひらがなでは登録できない" do
          @user.first_name_kana = "たろう"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
        it "birth_dateが空では登録できない" do
          @user.birth_date = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end
      end
    end
  end
end
