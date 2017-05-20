# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10000.times do
  Entry.create(title: Faker::Lorem.sentence, contents: Faker::Lorem.paragraph(2, true), date: Faker::Date.between(2.days.ago, Date.today))
end