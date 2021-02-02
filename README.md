## user テーブル

| Column     | Type         | Options     |
| ------     | ------       | ----------- |
| nickname   | string       | null: false |
| email      | string       | null: false |
| password   | string       | null: false |
| name       | string       | null: false |
| birthday   | string       | null: false |

### Association

- has_many   :item
- has_many   :order

## item テーブル

| Column          | Type         | Options     |  
| ------          | ------       | ----------- |
| title           | text         | null: false |
| description     | text         | null: false |
| category        | references   | null: false |
| item_state      | string       | null: false |
| shipping_fee    | string       | null: false |
| shipment_source | string       | null: false |
| shipping_days   | string       | null: false |
| price           | string       | null: false |
| user            | references   | null: false, foreign_key: true | 

### Association

- has_one    :order
- belongs_to :user

## order テーブル

| Column               | Type         | Options     |  
| ------               | ------       | ----------- |
| card_number          | string       | null: false |
| card_expiration_date | string       | null: false |
| security_cade        | string       | null: false |
| postal_code          | string       | null: false |
| prefectures          | string       | null: false |
| municipality         | string       | null: false |
| address              | text         | null: false |
| building_name        | text         |             |
| phone_number         | string       | null: false |
| item                 | references   | null: false, foreign_key: true | 
| user                 | references   | null: false, foreign_key: true |      

### Association

- has_one    :item
- belongs_to :user