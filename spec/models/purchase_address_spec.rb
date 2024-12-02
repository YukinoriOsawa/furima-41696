require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)

    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)

  end

  describe '購入情報の保存' do
    context '購入が成功する場合' do
      it 'すべての情報が正しく入力されていれば保存できる' do
        expect(@purchase_address).to be_valid
      end

        it '建物名がなくても保存できる' do
          @purchase_address.building = ''
          expect(@purchase_address).to be_valid
        end
    end
    

    context '購入が失敗する場合' do
      it '郵便番号が空では保存できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code を入力してください")
      end

      it '郵便番号にハイフンが含まれていない場合、保存できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '都道府県が選択されていない場合、保存できない' do
        @purchase_address.shipping_area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '市区町村が空では保存できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City を入力してください")
      end

      it '住所が空では保存できない' do
        @purchase_address.addresses = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Addresses を入力してください")
      end

      it '電話番号が空では保存できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number を入力してください")
      end

      it '電話番号が12桁以上では保存できない' do
        @purchase_address.phone_number = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が9桁以下では保存できない' do
        @purchase_address.phone_number = '0901234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号にハイフンが含まれていると保存できない' do
        @purchase_address.phone_number = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'トークンが空では保存できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token を入力してください")
      end
    end
  end
end
