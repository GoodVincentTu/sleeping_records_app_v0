# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_record = []
10.times do |i|
  user_record << {
    email: "testing-#{i}@example.com",
    password: 'password'
  }
end
User.create(user_record)

sleeping_records = []

30.times do |i|
  sleeping_records << {
    started_at: Time.now - i.days,
    ended_at: Time.now - i.days + i.hours
  }
end

User.all.each do |user|
  user.sleeping_records.create(sleeping_records)
end

p 'Successfully set up seed data'
