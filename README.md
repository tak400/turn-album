# DB設計

## usersテーブル

| Column | Type  | Options                 |
|:------:|:-----:|:-----------------------:|
|name    |string |null: false, index: true |
|email   |string |null: false, unique: true|

### Association
- has_many :images
- has_many :comments
- has_many :likes


## imagesテーブル

| Column | Type     | Options                      |
|:------:|:--------:|:----------------------------:|
|image   |string    |null: false                   |
|user    |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :albums, through: :images_albums
- has_many :tags, through: :images_tags
- has_many :days, through: :images_days
- has_many :comments
- has_many :likes


## albumsテーブル

| Column | Type     | Options                      |
|:------:|:--------:|:----------------------------:|
|name    |string    |null: false, index: true      |
|user_id |references|null: false, foreign_key: true|


### Association
- belongs_to :user
- has_many :images, through: :images_albums


## images_albumsテーブル

| Column | Type     | Options                      |
|:------:|:--------:|:----------------------------:|
|image_id|references|null: false, foreign_key: true|
|album_id|references|null: false, foreign_key: true|

### Association
- belongs_to :image
- belongs_to :album


## tagsテーブル

| Column | Type  | Options                 |
|:------:|:-----:|:-----------------------:|
|name    |string |null: false, index: true |

### Association
- has_many :images, through: :images_tags


## images_tagsテーブル

| Column | Type     | Options                      |
|:------:|:--------:|:----------------------------:|
|image_id|references|null: false, foreign_key: true|
|tag_id  |references|null: false, foreign_key: true|

### Association
- belongs_to :image
- belongs_to :tag


## daysテーブル

| Column | Type  | Options                 |
|:------:|:-----:|:-----------------------:|
|data    |string |null: false, index: true |

### Association
- has_many :images, through: :images_days


## images_daysテーブル

| Column | Type     | Options                      |
|:------:|:--------:|:----------------------------:|
|image_id|references|null: false, foreign_key: true|
|day_id  |references|null: false, foreign_key: true|

### Association
- belongs_to :image
- belongs_to :day


## commentsテーブル

| Column  | Type     | Options                      |
|:-------:|:--------:|:----------------------------:|
|body     |text      |                              |
|user_id  |references|null: false, foreign_key: true|
|image_id |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :image


## likesテーブル

| Column  | Type     | Options                      |
|:-------:|:--------:|:----------------------------:|
|user_id  |references|null: false, foreign_key: true|
|image_id |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :image