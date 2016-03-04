# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# User.create! [
#   { name: "Shubham", password: "123456"},
#   { name: "Satyam", password: "qwerty"}
# ]

Rating.destroy_all
BlogPost.destroy_all
User.destroy_all

3.times { |i| User.create! name: "user#{i}", password: "123456" }

5.times { |i| BlogPost.create! title: "Title #{i}", description: "Description #{i}", author: "Author #{i}"}

users = User.all

BlogPost.all.each do |blog_post|
  blog_post.user = users.sample
  blog_post.save
end

BlogPost.all.each do |blog_post|
  a = i = 0.0
  User.all.each do |user|
    x = ((rand * 5).round 1)
    Rating.create! [ user_id: user.id, blog_post_id: blog_post.id, rating: x ]
    a = a + x
    i = i + 1
  end
  blog_post.avgrating = (a/i).round 2
  blog_post.save
end