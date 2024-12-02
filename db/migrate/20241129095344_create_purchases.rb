class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.references :item, null: false, foreign_key: true  # 商品ID（itemsテーブルへの外部キー）
      t.references :user, null: false, foreign_key: true  # 購入者ユーザーID（usersテーブルへの外部キー）

      t.timestamps
    end
  end
end