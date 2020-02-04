# README

**establish database**

## Users Table
|Column|Type|Options|
|------|----|-------|
|image|text||
|nickname|string|null: false|
|name|string|null: false|
|name_kana|string|null: false|
|email|string|null: false|
|password|integer|null: false|
|tel|string|null: false|
|birth|date|null: false|
|prefecture|integer|null: false|
|introduction|text|null: false|
|performance|text||
|portfolio|text||
|musician_id|references|foreign_key: true|
### Association
- has_many :likes
- has_many :liked_matters, through: :likes, source: :matter
- has_many :messages
- has_many :matter_categoryies, through: :tags
- has_many :tags
- belongs_to :block
- belongs_to :musician


## Musicians Table
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|image|text||
|name|string|null: false|
|biography|text|null: false|
|activity_history||
|activity_place|string||
|email|string|null: false|
|sound_source|text||
|homepage|text||
|twitter|text||
|facebook|text||
|other_link|text||
|live_info|text||
|office|string||
### Association
- has_many :matters
- has_many :messages
- belongs_to :user
- belongs_to :block


## Blocks Table
|Column|Type|Options|
|------|----|-------|
|musician_id|references|null: false, foreign_key: true|
|block_id|references|null: false, foreign_key: true|
### Association
- belongs_to :musician
- belongs_to :block,class_name: “User”


## Matters Table
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|reward|integer|null: false|
|start|date||
|end|date|null: false|
|content|text|null: false|
|payment|string||
|supplement|text||
|status|integer|null: false|
|musician_id|references|null: false, foreign_key: true|
### Association
- has_many :likes
- has_many :liked_users, through: :likes, source: :user
- has_many :messages
- belongs_to :musician
- belongs_to :matter_category


## Matter_categories Table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :matters
- has_many :users, through: :tags


## Tags Table
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|matter_category_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :Matter_category


## Likes Table
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|matter_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :matter


## Messages Table
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|references|null: false, foreign_key: true|
|musician_id|references|null: false, foreign_key: true|
|matter_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :musician
- belongs_to :matter