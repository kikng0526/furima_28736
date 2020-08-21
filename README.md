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

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| nickname | string | null: false |
| password | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| birth    | integer| null: false |

### Association

- has_many :product
- has_many :comment
- has_many :card

## products テーブル

| Column | Type       | Options     |
| ------ | ------     | ----------- |
| name   | string     | null: false |
| image  |            | null: false |
| text   | text       | null: false |
| price  | integer    | null: false |
| user   | references | null: false |

### Association

- belongs_to :user
- has_many :comment
- has_one :card

## comments テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user

## cards テーブル ##購入する時の情報

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| credit  | integer    | null: false,                   |
| address | text       | null: false,                   |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user