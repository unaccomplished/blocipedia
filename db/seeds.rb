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

20.times do
  Wiki.create!(
    title: Faker::Lorem.characters(10),
    body:  Faker::Lorem.paragraph
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

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
