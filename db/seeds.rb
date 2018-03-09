# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'

# User.all.destroy

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

  Exercise.create([{
    name:"FIX Forward Head Posture! (Daily Corrective Routine)",
    content:"https://www.youtube.com/watch?v=wQylqaCl8Zo",
    catergory:"neck"
  },
  {
    name:"4 stretches that get rid of neck pain and give you better posture",
    content:"https://www.youtube.com/watch?v=NaShux69R1w",
    catergory:"neck"
  },
  {
    name:"Corrective Exercise Forward Head Posture",
    content:"https://www.youtube.com/watch?v=JA3O0NVb-sk",
    catergory:"neck"
  },
  {
    name:"how to Get Rid of a Neck Hump",
    content:"https://www.youtube.com/watch?v=0OkB0xO_9kU",
    catergory:"neck"
  },
  {
    name: "5 Exercises To Fix Hunchback Posture",
    content:"https://www.youtube.com/watch?v=wr1ONXcq3yM",
    catergory:"back"
  },
  {
    name:"Improve Your Posture | 3 Exercises Only!",
    content:"https://www.youtube.com/watch?v=CqTtScFQ5-c",
    catergory:"back"
  },
  {
    name:"How To Fix Uneven Hips",
    content:"https://www.youtube.com/watch?v=lhbhay5_M-0",
    catergory:"back"
  },
  {
   name:"Exercise to Fix Posture and Open Your Hips",
    content:"https://www.youtube.com/watch?v=4LZ5Bv8ZV9s",
    catergory:"back"
  },
  ])

