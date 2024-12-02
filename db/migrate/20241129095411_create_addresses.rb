class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false                   # 郵便番号
      t.integer :shipping_area_id, null: false              # 都道府県（ActiveHashを想定）
      t.string :city, null: false                           # 市区町村
      t.string :addresses, null: false                      # 番地
      t.string :building                                    # 建物名（任意項目）
      t.string :phone_number, null: false                   # 電話番号
      t.references :purchase, null: false, foreign_key: true # 購入情報の外部キー

      t.timestamps
    end
  end
end

