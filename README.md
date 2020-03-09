# README

## App URL
[http://18.178.174.53](http://18.178.174.53 "http://18.178.174.53")

## Overview
ミュージシャンの音楽活動案件に特化したビジネスマッチングサービスです。
- ユーザーは会員登録を行う事で案件に応募ができるようになります。
- ミュージシャンは、会員登録後にアーティストプロフィールを作成する事で、案件依頼が作成できるようになります。


## Usage
- 案件検索機能 (キーワード or 案件カテゴリでの検索)
- **ユーザー新規登録** (ウィザード形式、公開・非公開ステータス有)、ログイン
  - 案件への応募機能
  - 案件依頼者への質問チャット機能
    - メッセージの「作成、編集、削除、既読 or 未読」機能
  - 案件のブックマーク機能
  - 会員情報編集機能
  - 応募した案件の一覧ページ
  - 質問を送ったチャットの一覧ページ
  - アーティストからの案件オファー一覧ページ
    - 案件の「確認済み・未確認」ステータス変更機能
  - ブックマークした案件の一覧ページ
  - **アーティストプロフィールページ作成**
    - 案件依頼の作成機能 (公開・非公開ステータス有)
      - 案件編集機能
    - アーティストプロフィール編集機能
    - 依頼作成済み案件の応募結果一覧ページ (案件ごとの「応募件数」と「応募ユーザー」の確認)
    - ユーザーからの質問チャット返信機能
      - メッセージの「作成、編集、削除、既読 or 未読」機能
    - ユーザー検索機能(ユーザー情報のスキルで検索)
      - ユーザーへの案件オファー送信機能
        - ユーザー毎のオファー取り消し機能
        - ユーザー毎のオファー済み案件一覧表示
[^1]: 上記のインデントは、上位項目の機能の登録後、もしくは上位項目のページの表示後に使用可能という意です。

***
# *establish database*

## Users Table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|name_kana|string|null: false|
|email|string|null: false|
|password|integer|null: false|
|tel|string|null: false|
|birthday|date|null: false|
|status|integer|null: false|
|prefecture|integer||
|introduction|text||
|performance|text||
|portfolio|text||
### Association
- has_many :likes
- has_many :liked_matters, through: :likes, source: :matter
- has_many :applications
- has_many :offers
- has_many :chats
- has_many :messages
- has_many :tags
- has_many :skills, through: :tags
- has_one :block
- has_one :musician


## Musicians Table
|Column|Type|Options|
|------|----|-------|
|image|string||
|name|string|null: false|
|biography|text|null: false|
|activity_history|text|
|activity_place|string||
|email|string|null: false|
|homepage|text||
|youtube|text||
|spotify|text||
|apple_music|text||
|twitter|text||
|facebook|text||
|otherlink_title|text||
|otherlink_url|text||
|live_info|text||
|office|string||
|user_id|references|null: false, foreign_key: true|
### Association
- has_many :matters
- has_many :chats
- has_many :messages
- belongs_to :user
- has_one :block


## Matters Table
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|reward|integer|null: false|
|deadline|date|null: false|
|prefecture|integer||
|start|date||
|end|date|null: false|
|content|text|null: false|
|payment|string||
|supplement|text||
|status|integer|null: false|
|musician_id|references|null: false, foreign_key: true|
|matter_category_id|references|null: false, foreign_key: true|
### Association
- has_many :likes
- has_many :liked_users, through: :likes, source: :user
- has_many :applications
- has_many :offers
- has_many :chats
- belongs_to :musician
- belongs_to :matter_category


## Applications Table
|Column|Type|Options|
|------|----|-------|
|matter_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :matter
- belongs_to :user


## Matter_categories Table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :matters


## Skills Table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :users, through: :tags
- has_many :tags


## Tags Table
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|matter_category_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :skill


## Likes Table
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|matter_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :matter


## Chats Table
|Column|Type|Options|
|------|----|-------|
|matter_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
### Association
- has_many :messages
- belongs_to :matter
- belongs_to :user
- belongs_to :musician


## Messages Table
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|references|null: false, foreign_key: true|
|chat_id|references|null: false, foreign_key: true|
|status|integer|null: false|
### Association
- belongs_to :user
- belongs_to :musician
- belongs_to :chat


## Offers Table
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|matter_id|references|null: false, foreign_key: true|
|status|integer|null: false|
### Association
- belongs_to :user
- belongs_to :matter
