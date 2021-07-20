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

## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| seller_place  | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| build_name    | string     | default: ""                    |
| phone_num     | string     | null: false                    |
| buys          | references | null: false, foreign_key: true |


### Association
- belongs_to :buy

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
| products           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buy

## buysテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| users              | references | null: false, foreign_key: true |
| products           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- belongs_to :address