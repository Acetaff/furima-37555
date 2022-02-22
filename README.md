# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| last_name          | string   | null: false               |
| first_name         | string   | null: false               |
| last_kana          | string   | null: false               |
| first_kana         | string   | null: false               |
| birthday           | datetime | null: false               |


## Association

- has_many :items
- has_one  :purchaser
- has_one  :product_purchase

## items テーブル

| Colum       | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | text       | null: false                    |
| description | text       | null: false                    |
| category_id | integer    | null: false                    |
| status_id   | integer    | null: false                    |
| burden_id   | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| days_id     | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one    :purchaser

## purchaser テーブル

| Colum          | Type       | Option                         |
| -------------- | ---------- | ------------------------------ |
| post_code      | integer    | null: false                    |
| prefectures_id | integer    | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_num      | integer    | null: false                    |
| item           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

## Association

- belongs_to :user

## product_purchase テーブル

| Colum  | Type  | Open                                |
| ------ | ----- | ----------------------------------- |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item