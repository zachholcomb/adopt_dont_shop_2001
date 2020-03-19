# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
shelter_1 = Shelter.create(name: "Denver Animal Shelter",
                           address: "500 Invisible St.",
                           city: "Denver",
                           state: "Colorado",
                           zip: "80201")

pet_1 = Pet.create(image: 'app/assets/images/border_collie.jpg',
                 name: 'Rover',
                 age: 3,
                 sex: "Male",
                 shelter: shelter_1,
                 description: "He's a Biter!",
                 status: "Pending Adoption")
