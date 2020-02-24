# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MatterCategory.create!(
  [
    {
      name: 'WEBデザイン'
    },
    {
      name: '紙デザイン'
    },
    {
      name: '物販デザイン'
    },
    {
      name: '物販制作'
    },
    {
      name: '音源制作'
    },
    {
      name: '作詞'
    },
    {
      name: 'ミキシング'
    },
    {
      name: 'マスタリング'
    },
    {
      name: '撮影監督'
    },
    {
      name: 'ライブカメラマン'
    },
    {
      name: 'MVカメラマン'
    },
    {
      name: '映像編集'
    },
    {
      name: '企画'
    },
    {
      name: '音響チェック'
    },
    {
      name: 'ローディー'
    },
    {
      name: '流通関連'
    },
    {
      name: '振付師'
    },
    {
      name: 'その他'
    }
  ]
)