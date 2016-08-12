# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

# Create an admin
admin = User.create!(
  email: 'hsu.joce@gmail.com',
  password: 'password',
  role: 'admin'
)

# Create a standard user with login info
standard = User.create!(
  email: 'jocelyn@joedigital.com',
  password: 'password'
)

# Create a premium user with login info
premium = User.create!(
  email: 'jocelyn@unaccomplishedlady.com',
  password: 'password',
  role: 'premium'
)
users = User.all

10.times do
  Wiki.create!(
    title: Faker::Lorem.characters(10),
    body:  Faker::Lorem.paragraph,
    private: false,
    user: users.sample
  )
end

Wiki.create!(
  title: 'My Very First Markdown Wiki',
  body:
  %Q{### There Is Something You Should Know!

  This is my very first post using markdown!

  How do you like it?  I learend this from [RichOnRails.com](http://richonrails.com/articles/rendering-markdown-with-redcarpet)!},
  user: users.sample
)

Wiki.create!(
  title: 'My Second Markdown Wiki',
  body:
  %Q{### My List of Things To Do!

  Here is the list of things I wish to do!

  * write more wikis
  * write even more wikis
  * write even more wikis!},
  user: users.sample
)

5.times do
  Wiki.create!(
    title: Faker::Lorem.characters(10),
    body: Faker::Lorem.paragraph,
    private: true,
    user: premium
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
