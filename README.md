# テーブル設計

## usersテーブル

| Column            |  Type     | Options      |
| ----------------  | --------- | -----------  |
| nickname          | string    | null: false  |
| email             | string    | null: false  |
| encrypted_password| string    | null: false  |
| name              | string    | null: false  |
| name_kana         | string    | null: false  |
| birthday          | date      | null: false  |

###Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column            |  Type     | Options      |
| ----------------  | --------- | -----------  |
| item_name         | string    | null: false  |
| text              | text      | null: false  |
| category          | integer   | null: false  |
| condition         | integer   | null: false  |
| delivery_fee      | integer   | null: false  |
| delivery_area     | integer   | null: false  |
| delivery_days     | integer   | null: false  |
| price             | integer   | null: false  |
| user              | references| null: false, foreign_key: true  |

###Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column            |  Type     | Options      |
| ----------------  | --------- | -----------  |
| user              | references| null: false, foreign_key: true  |
| item              | references| null: false, foreign_key: true  |

###Association

- belongs_to :user
- belongs_to :item

## addresses

| Column            |  Type     | Options      |
| ----------------  | --------- | -----------  |
| postal_code       | string    | null: false  |
| prefectures_id    | integer   | null: false  |
| address           | string    | null: false  |
| building_name     | string    |              |
| phone_number      | string    | null: false  |

- belongs_to :order

