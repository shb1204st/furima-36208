# README

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| kana_first_name    | string | null: false               |
| kana_last_name     | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :buys
- has_many :products
- belongs_to :address

## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| build_name    | string     | null: false, default: ""       |
| phone_num     | integer    | null: false                    |
| user          | references | null: false, foreign_key: true | 

### Association
- has_one :user

## productsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| product_explain    | text       | null: false                    |
| category_id        | integer    | null: false                    |
| product_status_id  | integer    | null: false                    |
| cost_id            | integer    | null: false                    |
| seller_place_id    | integer    | null: false                    |
| need_days_id       | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :buys

## buysテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| users              | references | null: false, foreign_key: true |
| products           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product