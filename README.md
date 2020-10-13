-# README
#　テーブル設計

##　users　テーブル

Things you may want to cover:
| Column           | Type   | Options      |
| ---------------- | ------ | ------------ |
| email            | string | null: false  |
| password         | string | null: false  |
| nickname         | string | null: false  |
| family_name      | string | null: false  |
| first_name       | string | null: false  |
| family_name_kana | string | null: false  |
| first_name_kana  | string | null: false  |
| birth_date       | date   | null: false  |

* Ruby version
### Association

* System dependencies
- has_many :items
- has_many :purchases

* Configuration
##　items　テーブル

* Database creation
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| text          | text       | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| genre         | integer    | null: false, foreign_key: true |
| item_status   | integer    | null: false, foreign_key: true |
| delivery_area | integer    | null: false, foreign_key: true |
| delivery_days | integer    | null: false, foreign_key: true |

* Database initialization
### Association

* How to run the test suite
- belongs_to :user
- belongs_to :purchase
- has_one_attached :image
- belongs_to_active_hash :state
- belongs_to_active_hash :genre
- belongs_to_active_hash :item_status
- belongs_to_active_hash :delivery_area
- belongs_to_active_hash :delivery_days

* Services (job queues, cache servers, search engines, etc.)
##　addresses　テーブル

* Deployment instructions
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| house_number | string     | null: false                    |
| city         | string     | null: false                    |
| building     | string     | null: false                    |
| tel          | string     | null: false                    |
| state        | integer    | null: false, foreign_key: true |

### Association

- has_many :purchases
- belongs_to_active_hash :state

##　purchases　テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :address
- has_many :items

