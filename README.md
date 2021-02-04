## users テーブル

| Column               | Type         | Options     |
| ------               | ------       | ----------- |
| nickname             | string       | null: false |
| email                | string       | null: false、unique: true |
| encrypted_password   | string       | null: false |
| first_name           | string       | null: false |
 last_name             | string       | null: false |
| first_name_katakana  | string       | null: false |
| last_name_katakana   | string       | null: false |
| birthday             | date         | null: false |

### Association

- has_many   :items
- has_many   :orders

## items テーブル

| Column             | Type         | Options     |  
| ------             | ------       | ----------- |
| title              | string       | null: false |
| description        | text         | null: false |
| category_id        | integer      | null: false |
| item_state_id      | integer      | null: false |
| shipping_fee_id    | integer      | null: false |
| prefecture_id      | integer      | null: false |
| shipping_day_id    | integer      | null: false |
| price              | integer      | null: false |
| user               | references   | null: false, foreign_key: true | 

### Association

- has_one    :order
- belongs_to :user

## orders テーブル

| Column               | Type         | Options     |  
| ------               | ------       | ----------- |
| item                 | references   | null: false, foreign_key: true | 
| user                 | references   | null: false, foreign_key: true |      

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address


## addresses テーブル

| Column               | Type         | Options     |  
| ------               | ------       | ----------- |
| postal_code          | integer      | null: false |
| prefecture_id        | integer      | null: false |
| municipality         | string       | null: false |
| address              | string       | null: false |
| building_name        | string       |             |
| phone_number         | string       | null: false |
| order                | references   | null: false, foreign_key: true |   

- belongs_to :order