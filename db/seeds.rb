# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


c1 = Category.create(title: "Marvel")
c2 = Category.create(title: "Game of the trons")
c3 = Category.create(title: "Vikings")
c4 = Category.create(title: "Doktor House")
c5 = Category.create(title: "Category 5")
c6 = Category.create(title: "Category 6")
c7 = Category.create(title: "Category 7")
c8 = Category.create(title: "Category 8")

Product.create(title: "Samareta Marvel", description: "Iron man", price: 20.5, image: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach01.jpg", category_id: c1.id)
Product.create(title: "Samareta Marvel", description: "Iron man", price: 20.5, image: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach01.jpg", category_id: c2.id)
Product.create(title: "Samareta Marvel", description: "Iron man", price: 20.5, image: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach01.jpg", category_id: c3.id)
Product.create(title: "Samareta Marvel", description: "Iron man", price: 20.5, image: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach01.jpg", category_id: c4.id)
Product.create(title: "Samareta Marvel", description: "Iron man", price: 20.5, image: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach01.jpg", category_id: c5.id)
Product.create(title: "Samareta Marvel", description: "Iron man", price: 20.5, image: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach01.jpg", category_id: c6.id)
Product.create(title: "Samareta Marvel", description: "Iron man", price: 20.5, image: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach01.jpg", category_id: c7.id)
Product.create(title: "Samareta Marvel", description: "Iron man", price: 20.5, image: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach01.jpg", category_id: c8.id)
