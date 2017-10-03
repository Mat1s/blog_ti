# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Rating.delete_all
#Post.delete_all
#User.delete_all
#User.create(login: "Zara")
#Post.create(title: "the first", body: "some text", user_id: 1, login: "Zara", ip: '93.85.154.89' )
# Post.create!([
#   { title: "the first", body: "some text", user_id: 1, login: "Zara", ip: '93.85.154.89'}
# ])
103.times do |n|
  login = Faker::Name.name + "#{n}"
  User.create!([{login: login}])
end

ip_list = []
50.times do |n|
  ip = Faker::Internet.ip_v4_address
  ip_list[n] = ip
end 

130000.times do |n|
  title = Faker::Company.name
  body = Faker::Company.catch_phrase
  user = User.find_by(id: rand(1..102))
  ip = ip_list[rand(1...50)]  
  post = user.posts.create!(title: title, body: body, ip: ip)
end

1000.times do |n|
  title = Faker::Company.name
  body = Faker::Company.catch_phrase
  post = Post.find_by(id: rand(1..100))
  ip = ip_list[rand(1...50)]  
  grade = rand(1..5)
  rating = post.ratings.create!(grade: grade)
end

2000.times do |n|
	title = Faker::Company.name
  body = Faker::Company.catch_phrase
  user = User.find_by(id: rand(1..102))
  ip = ip_list[rand(1..10)] 
  post = user.posts.create!(title: title, body: body, ip: ip)
end