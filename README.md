# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | nill: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| kana               | string | null: false               |
| birthday           | string | null: false               |


## Association

- has_many :items
- has_one  :product_purchase

## items テーブル

| Colum       | Type       | Options                        |
| ----------  | ---------- | ------------------------------ |
| description | text       | null: false                    |
| category    | string     | null: false                    |
| status      | string     | null: false                    |
| burden      | string     | null: false                    |
| area        | string     | null: false                    |
| days        | string     | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one    :product_purchase

## product_purchase テーブル

| Colum          | Type       | Option                         |
| -------------- | ---------- | ------------------------------ |
| post_code      | integer    | null: false                    |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_num      | integer    | null: false                    |
| item           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item