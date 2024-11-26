require 'rails_helper'

RSpec.describe Item, type: :model do
  # テスト用データのセットアップ
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品のバリデーション' do
    context '商品が保存できる場合' do
      it 'すべての情報が正しく入力されていれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が保存できない場合' do
      it '商品名が空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name を入力してください")
      end

      it '商品説明が空では保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description を入力してください")
      end

      it '価格が空では保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300以上¥9,999,999以下の半角数値で入力してください")
      end

      it '価格が300円未満では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300以上¥9,999,999以下の半角数値で入力してください")
      end

      it '価格が10000000円を超えると保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300以上¥9,999,999以下の半角数値で入力してください")
      end

      it '価格が半角数字以外だと保存できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は¥300以上¥9,999,999以下の半角数値で入力してください')
      end

      it '画像が空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image を1枚添付してください')
      end

      it 'カテゴリーが選択されていない場合は保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category を選択してください")
      end

      it '商品状態が選択されていない場合は保存できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status を選択してください")
      end

      it '配送料の負担が選択されていない場合は保存できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost を選択してください")
      end

      it '発送元の地域が選択されていない場合は保存できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area を選択してください")
      end

      it '発送までの日数が選択されていない場合は保存できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day を選択してください")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

    end
  end
end