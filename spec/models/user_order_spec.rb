require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it  'postal_code,municipality,address,phone_number,prefecture_id,tokenがあれば保存できる ' do
        expect(@user_order).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @user_order.building_name = ''
        expect(@user_order).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @user_order.postal_code = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_order.postal_code = '1234567'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが0では保存できないこと' do
        @user_order.prefecture_id = 0
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it 'municipalityが空だと保存できないこと' do
        @user_order.municipality = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressが空だと保存できないこと' do
        @user_order.address = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @user_order.phone_number = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが11桁以内の数値のみ保存できること' do
        @user_order.phone_number = '11111111111111'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it "tokenが空では登録できないこと" do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'phone_numberは英数字混合では登録できないこと' do
        @user_order.phone_number = '111111aaaaa'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'user_idが空では購入できないこと'
        @user.id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User id can't be blank")
      end

      it 'item_idが空では購入できないこと'
        @item.id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item id can't be blank")
      end
    end
  end
end