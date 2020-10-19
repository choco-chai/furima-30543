require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品情報登録' do
      context '新規登録がうまくいくとき' do
        it '全ての値が正しく入力されていれば登録できる' do
          expect(@item).to be_valid
        end
      end

      context '商品登録がうまくいかないとき' do
        it '商品画像を1枚付けないと登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名の入力がないと登録できない' do
          @item.title = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Title can't be blank")
        end
        it '商品の説明欄に入力がないと登録できない' do
          @item.text = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Text can't be blank")
        end
        it 'カテゴリーが選択されていないと登録できない' do
          @item.genre_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Genre can't be blank", 'Genre is not a number')
        end
        it 'カテゴリー選択でid:1を選択されていると登録できない' do
          @item.genre_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Genre must be other than 1')
        end
        it '商品の状態が選択されていないと登録できない' do
          @item.item_status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Item status can't be blank")
        end
        it '商品の状態選択でid:1を選択されていると登録できない' do
          @item.item_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Item status must be other than 1')
        end
        it '配送料の負担について選択されていないと登録できない' do
          @item.delivery_charge_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
        end
        it '配送料の負担選択でid:1を選択されていると登録できない' do
          @item.delivery_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery charge must be other than 1')
        end
        it '発送元の地域が選択されていないと登録できない' do
          @item.state_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("State can't be blank", 'State is not a number')
        end
        it '発送元の地域選択でid:1を選択されていると登録できない' do
          @item.state_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('State must be other than 1')
        end
        it '発送までの日数が選択されていないと登録できない' do
          @item.delivery_days_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery days can't be blank", 'Delivery days is not a number')
        end
        it '発送までの日数選択でid:1を選択されていると登録できない' do
          @item.delivery_days_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery days must be other than 1')
        end
        it '価格についての情報が入力されていないと登録できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '¥300より安い価格では登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than 299')
        end
        it '¥9,999,999より高い価格では登録できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end
        it '価格は全角数字では登録できない' do
          @item.price = '３００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
        it '価格に記号が含まれていると登録できない' do
          @item.price = 3, 0o00
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
      end
    end
  end
end
