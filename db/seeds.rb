
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


num = 1
5.times do
  # random = rand(10).to_i
  Park.create(name: Faker::Name.name ,description:'National Park in CA', picture: Faker::LoremPixel.image("50x60", false, 'nature',rand(10).to_i))
  num+=1

end
