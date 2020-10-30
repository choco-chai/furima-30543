require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入情報登録' do
    context '商品購入情報登録がうまくいくとき' do
      it 'クレジットカードの情報と配送先住所の情報が正しく入力されていれば保存ができること' do
        expect(@purchase_address).to be_valid
      end
      it '配送先住所の建物名は空でも保存できること' do
        @purchase_address.building = nil
        expect(@purchase_address).to be_valid
      end
      it '電話番号が11文字以内であれば保存できること' do
        @purchase_address.tel = '0458889999'
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入情報登録がうまくいかないとき' do
      it 'クレジットカードの情報が空では保存できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it '郵便番号が空では保存できないこと' do
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.postal_code = 1_112_222
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号はハイフンが必要です')
      end
      it '配送先住所の都道府県が選択されていないと保存できないこと' do
        @purchase_address.state_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('都道府県を入力してください')
      end
      it '配送先住所の都道府県選択でid:1を選択していると保存できないこと' do
        @purchase_address.state_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('都道府県は1以外の値にしてください')
      end
      it '配送先住所の市区町村が空では保存できないこと' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it '配送先住所の番地が空では保存できないこと' do
        @purchase_address.house_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空では保存できないこと' do
        @purchase_address.tel = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号が11文字以上では保存できないこと' do
        @purchase_address.tel = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は11文字以内の数字のみ入力できます')
      end
      it '電話番号にハイフン等の記号が含まれていると保存できないこと' do
        @purchase_address.tel = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は11文字以内の数字のみ入力できます')
      end
    end
  end
end
