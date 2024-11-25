class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

   # バリデーション
   validates :image, presence: { message: "を1枚添付してください" } # 商品画像の添付を必須にする
   validates :name, presence: { message: "を入力してください" }      # 商品名が必須
   validates :description, presence: { message: "を入力してください" } # 商品の説明が必須 
   validates :price, presence: true
   validates :price, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 300, 
    less_than_or_equal_to: 9999999, 
   message: "は¥300以上¥9,999,999以下の半角数値で入力してください"  
  }

  validates :category_id, numericality: { other_than: 1, message: "を選択してください" } # カテゴリが1（選択なし）でないこと
  validates :status_id, numericality: { other_than: 1, message: "を選択してください" }   # 商品の状態が1（選択なし）でないこと
  validates :shipping_cost_id, numericality: { other_than: 1, message: "を選択してください" } # 配送料の負担が1（選択なし）でないこと
  validates :shipping_area_id, numericality: { other_than: 1, message: "を選択してください" } # 発送元の地域が1（選択なし）でないこと
  validates :shipping_day_id, numericality: { other_than: 1, message: "を選択してください" }  # 発送までの日数が1（選択なし）でないこと

end
