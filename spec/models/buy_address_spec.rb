require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @buy_address = FactoryBot.build(:buy_address, user_id: user.id, product_id: product.id)
      sleep 0.1 
    end
    context '内容に問題ない場合' do
      it 'すべての情報があれば保存できること' do
        expect(@buy_address).to be_valid
      end

      it 'build_nameは空でも保存できること' do
        @buy_address.build_name = ''
        expect(@buy_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空では保存できないこと' do
        @buy_address.post_code = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeがにhyphenがなければ保存できないこと' do
        @buy_address.post_code = "0000000"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'post_codeは(3桁-4桁)以外はでは保存できないこと' do
        @buy_address.post_code = "1111-111"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end


      it 'seller_place_idが0では保存できないこと' do
        @buy_address.seller_place_id = 0
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Seller place can't be blank")
      end

      it 'cityが空では保存できないこと' do
        @buy_address.city = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では保存できないこと' do
        @buy_address.address = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numが空では保存できないこと' do
        @buy_address.phone_num = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone num can't be blank")
      end

      it 'phone_numにhyphenがあると保存できないこと' do
        @buy_address.phone_num = '090-1111-1111'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone num is invalid")
      end

      it 'phone_numは10桁以上11桁以下でしか保存できないこと' do
        @buy_address.phone_num = '090111111'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone num is invalid")
      end

      it 'phone_numが英数混合であると保存できないこと' do
        @buy_address.phone_num = '090aa11aa11'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone num is invalid")
      end

      it "tokenが空では購入できないこと" do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空では購入できないこと" do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end

      it "product_idが空では購入できないこと" do
        @buy_address.product_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Product can't be blank")
      end

    end
  end
end
