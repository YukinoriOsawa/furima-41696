FactoryBot.define do
  factory :item do
    name                  { 'サンプル商品' }  # 商品名
    description           { 'これはサンプルの商品です。' }  # 商品説明
    price                 { 1000 }  # 価格
    category_id           { 2 }  # カテゴリーID（仮にID1を設定）
    status_id             { 2 }  # 商品状態ID（仮にID1を設定）
    shipping_cost_id      { 2 }  # 配送料負担ID（仮にID1を設定）
    shipping_area_id      { 2 }  # 発送元地域ID（仮にID1を設定）
    shipping_day_id       { 2 }  # 発送日数ID（仮にID1を設定）
    user                  { association :user }  # ユーザー（関連付け）
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end