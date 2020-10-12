#　テーブル設計

##　users　テーブル

| Column           | Type   | Options      |
| ---------------- | ------ | ------------ |
| email            | string | null: false  |
| password         | string | null: false  |
| nickname         | string | null: false  |
| family_name      | string | null: false  |
| first_name       | string | null: false  |
| family_name_kana | string | null: false  |
| first_name_kana  | string | null: false  |
| birth_date       | string | null: false  |

### Association

- has_many :items
- has_many :purchases
- has_one :address

##　items　テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| text       | text       | null: false                    |
| price      | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one_attached :image
- belongs_to_active_hash :state
- belongs_to_active_hash :genre
- belongs_to_active_hash :item_status
- belongs_to_active_hash :delivery_area
- belongs_to_active_hash :delivery_days

##　addresses　テーブル

| Column       | Type        | Options                        |
| ------------ | ----------- | ------------------------------ |
| postal_code  | string      | null: false                    |
| house_number | string      | null: false                    |
| building     | string      |                                |
| tel          | integer     | null: false                    |
| user         | references  | null: false, foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to_active_hash :state
- belongs_to_active_hash :city

##　purchases　テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| address      | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :address
