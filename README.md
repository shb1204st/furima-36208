# README

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | text   | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| kana_name          | string | null: false |
| birthday           | string | null: false |

### Association
- has_many :buys
- has_many :products

## buysテーブル

| Column       | Type       | Options                        |
| ------------ | ------     | ------------------------------ |
| card_info    | string     | null: false                    |
| card_expire  | string     | null: false                    |
| secure_code  | string     | null: false                    |
| post_code    | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| build_name   | string     | null: false                    |
| phone_num    | string     | null: false                    |
| user         | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- has_one    :product

## goodsテーブル

| Column          | Type       | Options                        |
| -----------     | ---------- | ------------------------------ |
| product_name    | string     | null: false                    |
| product_explain | text       | null: false                    |
| category        | string     | null: false                    |
| product_status  | string     | null: false                    |
| cost            | string     | null: false                    |
| seller_place    | string     | null: false                    |
| need_days       | string     | null: false                    |
| price           | string     | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :buy