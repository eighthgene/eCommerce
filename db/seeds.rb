# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


c1 = Category.create(title: "Harry Potter")
c2 = Category.create(title: "Game of the trons")
c3 = Category.create(title: "Star Wars")
c4 = Category.create(title: "The Walking Dead")
c5 = Category.create(title: "Dragon Ball")
c6 = Category.create(title: "Lord of the rings")
c7 = Category.create(title: "Jurassic Park")
c8 = Category.create(title: "Pokemon")

# Harry Potter
Product.create(title: "Magizoology", description: "Short sleeve t-shirt made of 100% cotton straight cut and round neck. Personalized with Harry Potter design from Hogwarts Castle.",
               price: 10.95, image: "products/harrypotter1.png", category_id: c1.id)
Product.create(title: "Hogwarts", description: "Short sleeve t-shirt made of 100% cotton straight cut and round neck. Personalized with Harry Potter design of magical creatures.",
               price: 12.90, image: "products/harrypotter2.png", category_id: c1.id)
Product.create(title: "Patronus", description: "Short sleeve t-shirt made of 100% cotton straight cut and round neck. Personalized with Harry Potter design of patronus and silhouettes.",
               price: 11.95, image: "products/harrypotter3.png", category_id: c1.id)

# Game of the trons
Product.create(title: "GOT houses", description: "Short sleeve t-shirt made of 100% cotton straight cut and round neck. Personalized with Game of Thrones design of the grounds of the houses.",
               price: 11.95, image: "products/gamethrones1.png", category_id: c2.id)

Product.create(title: "Jon Snow Winte", description: "Short sleeve t-shirt made of 100% cotton straight cut and round neck. Personalized with Game of Thrones design by Jon Snow.",
               price: 10.99, image: "products/gamethrones3.png", category_id: c2.id)

Product.create(title: "Stark house", description: "Short sleeve t-shirt made of 100% cotton straight cut and round neck. Personalized with Game of Thrones design from members of the Stark house.",
               price: 13.95, image: "products/gamethrones2.png", category_id: c2.id)


Product.create(title: "Daenerys Dragones", description: "Short sleeve t-shirt made of 100% cotton straight cut and round neck. Personalized with Game of Thrones design of the silhouettes of Daenerys and dragons.",
               price: 11.90, image: "products/gamethrones4.png", category_id: c2.id)

# Star Wars
Product.create(title: "Death Star Green", description: "Short sleeve t-shirt made of 100% cotton straight cut and round neck. Personalized with Star Wars design of the Death Star.",
               price: 10.95, image: "products/starwars2.png", category_id: c3.id)

Product.create(title: "Dark Side", description: "Short sleeve t-shirt made of 100% cotton straight cut and round neck. Personalized with Darth Vader Star Wars design in color.",
               price: 12.95, image: "products/starwars1.png", category_id: c3.id)

Product.create(title: "Darth Vader Red", description: "Short sleeve t-shirt made of 100% cotton straight cut and round neck. Personalized with Darth Vader's Star Wars design in red.",
               price: 11.90, image: "products/starwars4.png", category_id: c3.id)

Product.create(title: "Darth Maul", description: "Short sleeve t-shirt made of 100% cotton straight cut and round neck. Personalized with Star Wars design of the face of Darth Maul hooded.",
               price: 10.95, image: "products/starwars3.png", category_id: c3.id)

# The Walking Dead
# Dragon Ball
# Lord of the rings
# Jurassic Park
# Pokemon





