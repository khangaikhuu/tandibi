# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!(
  first_name: "Sam",
  last_name: "Yamashita",
  email: "sam@example.com",
  username: "samsam"
  )

user2 = User.create!(
  first_name: "Adam",
  last_name: "Notodikromo",
  email: "adam@example.com",
  username: "adam123"
 )
