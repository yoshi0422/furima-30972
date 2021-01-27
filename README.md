# テーブル設計

## usersテーブル

| Column            |  Type     | Options      |
| ----------------  | --------- | -----------  |
| nickname          | string    | null: false  |
| email             | string    | null: false  |
| password          | string    | null: false  |
| password_confirm  | string    | null: false  |
| name              | string    | null: false  |
| name_kana         | string    | null: false  |
| birthday          | integer   | null: false  |

###Association

- has_many :item
- has_many :order

## itemsテーブル

| Column            |  Type     | Options      |
| ----------------  | --------- | -----------  |
| item_name         | string    | null: false  |
| text              | text      | null: false  |
| detail            | string    | null: false  |
| send              | string    | null: false  |
| price             | integer   | null: false  |
| user              | references| null: false, foreign_key: true  |

###Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column            |  Type     | Options      |
| ----------------  | --------- | -----------  |
| card_number       | string    | null: false  |
| card_limit        | string    | null: false  |
| card_code         | string    | null: false  |
| postal_code       | string    | null: false  |
| prefectures       | string    | null: false  |
| address           | string    | null: false  |
| building_name     | string    | null: false  |
| phone_number      | string    | null: false  |
| user              | references| null: false, foreign_key: true  |

###Association

- belongs_to :user
- belongs_to :item

