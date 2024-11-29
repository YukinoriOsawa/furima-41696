class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :addresses, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :user_id
    validates :item_id
    # validates :token
  end

  def save
    # 購入情報を保存し、変数purchaseに代入
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    
    # 住所情報を保存
    Address.create(
      postal_code: postal_code, 
      shipping_area_id: shipping_area_id, 
      city: city, 
      addresses: addresses, 
      building: building, 
      phone_number: phone_number, 
      purchase_id: purchase.id
    )
  end
end
