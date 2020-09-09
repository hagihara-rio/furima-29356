# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...




#テーブル設計


## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthdate       | xxxxxx | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders
- has_one :addresse
- has_one :credit

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| itemname      | string     | null: false                    |
| detail        | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| shipping_fee  | string     | null: false                    |
| shipping_area | string     | null: false                    |
| shipping_days | string     | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| brand_id      | references | null: false, foreign_key: true |
| categorie_id  | references | null: false, foreign_key: true |

### Association

- has_many :comments
- has_one :order
- belongs_to :user
- belongs_to :brand
- belongs_to :categorie

## order テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| favorite      | boolean    |                                |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| order_id      | references | null: false, foreign_key: true |

### Association

- has_one :credit
- belongs_to :user
- belongs_to :order

## credits テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| card_number | string     | null: false                    |
| user_id     | references | null: false, foreign_key: true |
| address_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :address

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| coment_text | text       |                                |
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## brands テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| brand     | string | null: false |

### Association

- has_many :items

## categories テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| categorie | string | null: false |

### Association

- has_many :items

