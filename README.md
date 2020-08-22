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
| date           | integer| null: false |

### Association

- has_many :product
- has_many :comment
- has_one :management

## products テーブル

| Column   | Type       | Options     |
| -------- | ------     | ----------- |
| name     | string     | null: false |
| text     | text       | null: false |
| price    | integer    | null: false |
| detail   | string     | null: false |
| delivery | string     | null: false |
| user     | references | null: false |

### Association

- belongs_to :user
- has_many :comment
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
- has_one :addresses

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| city           | string     | null: false                    |
| address_line   | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| management     | references | null: false, foreign_key: true |

### Association

- belongs_to :management

## comments テーブル