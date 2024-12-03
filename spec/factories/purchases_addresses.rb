FactoryBot.define do
  factory :purchase_address do
    postal_code         { '123-4567' }
    shipping_area_id    { 2 } # 1が無効とされているため、2以上の値を設定
    city                { '東京都' }
    addresses           { '1-1-1' }
    building            { '東京ハイツ' }
    phone_number        { '09012345678' }
    token               { 'tok_abcdefghijk00000000000000000' }

    end
  end
