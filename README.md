#chatspaceの機能
*新規登録機能
*1対1のチャット機能
*複数人によるグループチャット機能
*チャット相手の検索機能
*チャットグループへのユーザー招待機能
*チャットの履歴表示機能
*画像送信機能
*チャットの自動更新

#chatspaceデータ設計書
*not null => NOT NULL制約
*unique => 一意性制約
*foreign_key => 外部キー制約
*index => インデックス

#usersテーブル
カラム      |型       |制約             |
:----------|:-------|:---------------|
name       |string  |not null  /index|
email      |string  |nil :false      |
password   |string  |nil :false      |

##関連性
*has_many :groups
*has_many :messages
*has_many :groups, through :users_groups

#messagesテーブル
カラム    |型      |制約        |
:--------|:-------|-----------|
body     |text    |not null   |
image    |string  |           |
group_id |integer |foreign_key|
user_id  |integer |foreign_key|

##関連性
*belongs_to :user
*belongs_to :group

#groupsテーブル
カラム      |型    |制約     |
:----------:------|--------|
group_name |string|not null|

##関連性
*has_many :messages
*has_many :users
*has_many :users, through :users_groups

#users_groupsテーブル
カラム     |型         |制約                |
:---------|:---------|:-------------------|
user_id   |references|not null/foreign_key|
group_id  |references|not null/foreign_key|

#関連性
*berongs_to :user
*belongs_to :group

