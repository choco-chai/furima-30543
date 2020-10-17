require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end
  
    describe '商品情報登録' do
      context '新規登録がうまくいくとき' do
        it "全ての値が正しく入力されていれば登録できる" do
          expect(@item).to be_valid
        end
      end
  
      context '商品登録がうまくいかないとき' do
        it "商品画像を1枚付けないと登録できない" do
        end
        it "商品名の入力がないと登録できない" do
        end
        it "商品の説明欄に入力がないと登録できない" do
        end
        it "カテゴリーが選択されていないと登録できない" do
        end
        it "商品の状態が選択されていないと登録できない" do
        end
        it "配送料の負担について選択されていないと登録できない" do
        end
        it "発送元の地域が選択されていないと登録できない" do
        end
        it "価格についての情報が入力されていないと登録できない" do
        end
        it "¥300~¥9,999,999の間の価格でないと登録できない" do
        end
        it "価格は半角数字でないと登録できない" do
        end
      end
    end
  end
end
