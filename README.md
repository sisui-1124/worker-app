.アプリ名 
  worker.app

.概要
  打刻機能、ユーザー登録機能

.制作背景（意図）
会社出勤時の紙面での勤怠管理が主だったので、その作業をもっと効率よく出来ないかと思い、アプリを作成しました。

.DEMO

.実装予定の内容
現在打刻機能しかないため、グループ作成機能を使ってグループでの管理ができるようにしたい。

.DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name  |string|null: false|
|email |string|null: false|
|ebcrypted_password|string|false|
## Association
- has_many :groups
- has_many :groups_users

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
# Association
- has_many :users
- has_many :groups_users

## groups_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user|integer|null: false, foreign_key: true|
|group|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group