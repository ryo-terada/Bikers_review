# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "admin@admin",
  password: "bikeman",
)

User.create!(
  [
    {
      id: 1,
      email: "ichiro@test.com",
      password: "ichiro01",
      name: "イチロウ",
      introduction: "おはようございます",
      is_deleted: false,
      user_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.png"), filename:"sample-user1.png")
    },
    {
      id: 2,
      email: "niro@test.com",
      password: "niro01",
      name: "二ロウ",
      introduction: nil,
      is_deleted: false,
      user_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.png"), filename:"sample-user2.png")
    },
    {
      id: 3,
      email: "sanro@test.com",
      password: "sanro01",
      name: "サンロウ",
      introduction: "こんにちは",
      is_deleted: true,
      user_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.png"), filename:"sample-user3.png")
    },
    {
      id: 4,
      email: "yonro@test.com",
      password: "yonro01",
      name: "ヨンロウ",
      introduction: "こんばんは",
      is_deleted: false,
      user_image: nil,
    }
  ]
)

Bike.create!(
  [
   {
     id: 1,
     manufacturer: "ホンダ",
     bike_name: "cbr250rr",
     first_impression: "250cc最強バイク！",
     body: "とにかく乗っていて楽しい、250ccでナンバーワンのスポーツ性能。",
     user_id: 1,
     bike_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-bike1.png"), filename:"sample-bike1.png"),
   },
   {
     id: 2,
     manufacturer: "ヤマハ",
     bike_name: "yzf-r25",
     first_impression: "ワインディングが楽しい！",
     body: "値段と性能のバランスが良くみんなにオススメできるバイクです。",
     user_id: 1,
     bike_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-bike2.png"), filename:"sample-bike2.png"),
   },
   {
     id: 3,
     manufacturer: "スズキ",
     bike_name: "gsx250r",
     first_impression: "コスパ最強！",
     body: "安いのにめちゃくちゃかっこいい",
     user_id: 2,
     bike_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-bike3.png"), filename:"sample-bike3.png"),
   },
   {
     id: 4,
     manufacturer: "カワサキ",
     bike_name: "ninja250",
     first_impression: "かっこよさNo1！",
     body: "昔から人気のあるバイクでスポーツ性能もかなり高い。",
     user_id: 3,
     bike_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-bike4.png"), filename:"sample-bike4.png"),
   }
  ]
)