# This file should contain all the record creation needed to seed
# the database with its default values.
# The data can then be loaded with the rake db:seed
# (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Token.destroy_all
Item.destroy_all
Bucketlist.destroy_all
User.destroy_all

2.times do |i|
  user = User.create(
    name: Faker::Name.name,
    email: "science#{i + 1}@gmail.com",
    password: "science"
  )

  3.times do
    bucketlist = Bucketlist.create(
      name: Faker::Company.buzzword,
      user_id: user.id
    )

    2.times do
      Item.create(
        name: Faker::Company.catch_phrase,
        bucketlist_id: bucketlist.id
      )
    end
  end
end

# Generate a buzzword-laden catch phrase.
# Faker::Company.catch_phrase #=> "Business-focused coherent parallelism"
