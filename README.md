# README

## usersテーブル

|column            |Type       |Options                   |
|------------------|-----------|--------------------------|
|nickname          |string     |null: false               |
|email             |string     |unique: true, null: false |
|password          |string     |null: false               |

### Association
has_many :pictures


## picturesテーブル

|column            |Type       |Options                   |
|------------------|-----------|--------------------------|
|text              |string     |null: false               |
|user              |references |foreign_key :true         |
|public_private    |string     |null: false               |

### Association
has_many :memos, dependent: :destroy
belongs_to :user


## memosテーブル

|column            |Type       |Options                   |
|------------------|-----------|--------------------------|
|info              |text       |                          |
|picture           |references |foreign_key :true         |
|offsetX           |float      |null: false               |
|offsetY           |float      |null: false               |

### Association
belongs_to picture