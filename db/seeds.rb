# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy.all

default_password = "123456"

default_age = [1..10]

10.times do
  User.create(
    name:Faker::Name.name,
    email:Faker::Internet.email,
    password:default_password,
    age: default_age.sample
  )
end

10.times do
  Exercise.create(
    name:Faker::Superhero.power,
    content:Faker::OnePiece.akuma_no_mi,
    catergory:Faker::Dog.breed
  )
end

