# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.all.each do |user|
#   Avatar.create(user_id: user.id, image: "http://lorempixel.com/#{Faker::Number.between(400,500)}/#{Faker::Number.between(400,500)}/people")
# end
# User.all.each do |user|
#   Post.create(content: Faker::Lorem.sentences(7), title: Faker::StarWars.wookie_sentence, is_published: true, user_id: user.id)
# end
# User.all.each do |user|
#   Post.all.each do |post|
#     PostImage.create(user_id: user.id, post_id: post.id, url: "http://lorempixel.com/#{Faker::Number.between(1800,1900)}/#{Faker::Number.between(1000,1200)}", description: "Faker::Lorem.sentence")
#   end
# end
Post.all.each do |post|
  CategorizedPost.create(post_id: post.id, category_id: Category.pluck(:id).sample)
  CategorizedPost.create(post_id: post.id, category_id: Category.pluck(:id).sample)
end 
puts "Done!"