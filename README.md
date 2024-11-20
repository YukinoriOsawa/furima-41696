# テーブル設計

## users table

| Column             | Type       | Options                    |
|--------------------|------------|----------------------------|
| email              | string     | null: false, unique: true  |
| encrypted_password | string     | null: false                |
| nickname           | string     | null: false                |
| last_name          | string     | null: false                |
| first_name         | string     | null: false                |
| last_name_kana     | string     | null: false                |
| first_name_kana    | string     | null: false                |
| birth_date         | date       | null: false                |




### Association

* has_many :items
* has_many :purchases

## items table

| Column           | Type       | Options                          |
|------------------|------------|----------------------------------|
| name             | string     | null: false                      |
| description      | text       | null: false                      |
| category_id      | integer    | null: false                      |
| status_id        | integer    | null: false                      |
| shipping_cost_id | integer    | null: false                      |
| shipping_area_id | integer    | null: false                      |
| shipping_day_id  | integer    | null: false                      |
| price            | integer    | null: false                      |
| user             | references | foreign_key: true, null: false   |



### Association

- belongs_to :user
- has_one :purchase

## addresses table

| Column           | Type       | Options                          |
|------------------|------------|----------------------------------|
| postal_code      | string     | null: false                      |
| shipping_area_id | integer    | null: false                      |
| city             | string     | null: false                      |
| addresses        | string     | null: false                      |
| building         | string     |                                  |
| phone_number     | string     | null: false                      |
| purchase         | references | foreign_key: true, null: false   |


### Association

- belongs_to :purchase

## Purchases table

| Column | Type       | Options                          |
|--------|------------|----------------------------------|
| item   | references | foreign_key: true, null: false   |
| user   | references | foreign_key: true, null: false   |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address