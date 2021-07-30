require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '商品出品' do
    before do
      @product = FactoryBot.build(:product)
    end

    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@product).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'imageが空では出品できないこと' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("画像を入力してください")
      end

      it 'product_nameが空では出品できないこと' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("商品名を入力してください")
      end

      it 'product_explainが空では出品できないこと' do
        @product.product_explain = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("商品説明を入力してください")
      end

      it 'category_idの選択が1では出品できないこと' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("カテゴリーを選択してください")
      end

      it 'product_statu_idの選択が1では出品できないこと' do
        @product.product_statu_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の状態を選択してください")
      end

      it 'cost_idの選択が1では出品できないこと' do
        @product.cost_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("配送料の負担を選択してください")
      end

      it 'seller_place_idの選択が0では出品できないこと' do
        @product.seller_place_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("発送元の地域を選択してください")
      end

      it 'need_day_idの選択が1では出品できないこと' do
        @product.need_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("発送までの日数を選択してください")
      end

      it 'priceが空では出品できないこと' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("価格を入力してください", "価格は数値で入力してください", "価格は不正な値です")
      end

      it 'priceが¥300〜9,999,999範囲意外では出品できないこと' do
        @product.price = 200
        @product.valid?
        expect(@product.errors.full_messages).to include('価格は300以上の値にしてください')
      end

      it 'priceが¥300〜9,999,999範囲意外では出品できないこと' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end

      it 'priceが全角文字では出品できないこと' do
        @product.price = '２００'
        @product.valid?
        expect(@product.errors.full_messages).to include('価格は数値で入力してください')
      end

      it 'priceが半角英数混合では出品できないこと' do
        @product.price = '3000a'
        @product.valid?
        expect(@product.errors.full_messages).to include('価格は数値で入力してください')
      end

      it 'priceが半角英字では出品できないこと' do
        @product.price = 'abcde'
        @product.valid?
        expect(@product.errors.full_messages).to include('価格は数値で入力してください')
      end

      it 'userが紐付いていなければ出品できないこと' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
