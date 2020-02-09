# README

**establish database**

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
- has_many :chats
- has_many :messages
- has_many :matter_categoryies, through: :tags
- has_many :tags
- has_one :block
- has_one :musician


## Musicians Table
|Column|Type|Options|
|------|----|-------|
|image|text||
|name|string|null: false|
|biography|text|null: false|
|activity_history|text|
|activity_place|string||
|email|string|null: false|
|sound_source|text||
|homepage|text||
|twitter|text||
|facebook|text||
|other_link|text||
|live_info|text||
|office|string||
|user_id|references|null: false, foreign_key: true|
### Association
- has_many :matters
- has_many :chats
- has_many :messages
- belongs_to :user
- has_one :block


## Blocks Table
|Column|Type|Options|
|------|----|-------|
|musician_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :musician
- belongs_to :user


## Matters Table
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|reward|integer|null: false|
|deadline|date|null: false|
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
- has_many :users, through: :tags
- has_many :tags


## Tags Table
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|matter_category_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :matter_category


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
|musician_id|references|null: false, foreign_key: true|
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
|musician_id|references|null: false, foreign_key: true|
|chat_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :musician
- belongs_to :chat
