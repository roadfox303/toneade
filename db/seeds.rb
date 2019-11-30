# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
30.times do |n|
  User.create(name: "テストさん#{n+1}" ,
               email: "test#{n+1}@gmail.com",
               password: "password"
               )
end

20.times do |n|
  Blog.create(title: "シード#{n+1}" ,
              content: "シードコメント#{n+1}",
              user_id: User.find(n+1).id,
              phrase_attributes: {
                user_id: User.find(n+1).id,
                key: 1,
                scale: 1,
                bpm: 120,
                master_data: "",
                tracks_attributes: [
                  name: "track1",
                  tr_type: 1,
                  instrument: [],
                  data: []
                ]
              }

              )
end
