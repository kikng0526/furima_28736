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

# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| first_name     | string | null: false |
| first_kana     | string | null: false |
| last_name      | string | null: false |
| last_kana      | string | null: false |
| nickname       | string | null: false |
| password       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| date           | date   | null: false |

### Association

- has_many :products
- has_many :comments
- has_one :management

## products テーブル

| Column      | Type       | Options                        |
| ----------  | ------     | ------------------------------ |
| name        | string     | null: false                    |
| text        | text       | null: false                    |
| price       | integer    | null: false                    |
| category_id | integer    | null: false                    |
| status_id   | integer    | null: false                    |
| burden_id   | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| day_id      | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :management

## comments テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user

## managements テーブル ##購入管理をするテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| product | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user
- has_one :address

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| address_line   | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| management     | references | null: false, foreign_key: true |

### Association

- belongs_to :management

## comments テーブル