# README

## membersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, foreign_key: true|

### Association
- has_many :posts
- has_many :groups,through => :members

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, foreign_key: true|

### Association
- has_many :posts
- has_many :groups,through => :members

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|null: false, foreign_key: true|
|image|string|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- has_many :users
- has_many :groups

