require 'rails_helper'

RSpec.describe Item, type: :model do
  
    before do
      @item = FactoryBot.build(:item)
    end
  describe '新規出品' do
    context '新規出品できるとき' do
      it 'title、description、category_id、item_state_id、shipping_fee_id、prefecture_id、shipping_day_id、priceが存在していれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '新規出品できないとき' do

      it 'imageが空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'titleが空では保存できないこと' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it 'descriptionが空では保存できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが0では保存できないこと' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it 'item_state_idが0では保存できないこと' do
        @item.item_state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state must be other than 0")
      end

      it 'shipping_fee_idが0では保存できないこと' do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 0")
      end

      it 'prefecture_idが0では保存できないこと' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it 'shipping_day_idが0では保存できないこと' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 0")
      end

      it 'priceは¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceは半角数字のみ保存可能であること' do
        @item.price = '２００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceは半角英数混合では登録できないこと' do
        @item.price = '300a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceは半角英語だけでは登録できないこと' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'userと紐づいてないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
