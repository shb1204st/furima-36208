require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "商品出品" do
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
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it 'product_nameが空では出品できないこと' do
        @product.product_name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end

      it 'product_explainが空では出品できないこと' do
        @product.product_explain = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Product explain can't be blank")
      end

      it 'category_idの選択が1では出品できないこと' do
        @product.category_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it 'product_status_idの選択が1では出品できないこと' do
        @product.product_status_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Product status can't be blank")
      end

      it 'cost_idの選択が1では出品できないこと' do
        @product.cost_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Cost can't be blank")
      end

      it 'seller_place_idの選択が0では出品できないこと' do
        @product.seller_place_id = "0"
        @product.valid?
        expect(@product.errors.full_messages).to include("Seller place can't be blank")
      end

      it 'need_days_idの選択が1では出品できないこと' do
        @product.need_days_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Need days can't be blank")
      end

      it 'priceが空では出品できないこと' do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが¥300〜9,999,999範囲意外では出品できないこと' do
        @product.price = "200"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが半角数字意外では出品できないこと' do
        @product.price = "２００"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
