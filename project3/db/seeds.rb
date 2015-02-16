# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all  #deletes all users for normality

10.times do |i|  #creates 10 users
  User.create(
    email: "user#{i}@example.com",
    password: "password",
    password_confirmation: "password"
  )
end