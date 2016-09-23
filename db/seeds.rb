# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |n|
  email = Faker::Internet.email
  name = Faker::Name.name
  password = "password"
  User.create!(email: email,
       name: name,
       password: password,
       password_confirmation: password
               )
end

10.times do |n|
image = Faker::Avatar.image
caption = Faker::Lorem.words
user_id = Faker::Number.between(1, 100)
Post.create!(
image: image,
caption: caption,
user_id: user_id

)
end
