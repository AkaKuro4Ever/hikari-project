# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: "clari2", email: "clari@hogwarts.edu", password: "Hello", password_confirmation: "Hello")
user_1 = User.create(username: "roselilia", email: "rose@hogwarts.edu", password: "MyAccount", password_confirmation: "MyAccount")
user_2 = User.create(username: "Seaweed", email: "seaweed@hogwarts.edu", password: "yumyum", password_confirmation: "yumyum")
user_2.books << book = Book.create(title: "Blinding Shadow", user_ids: [1])
user_2.books << book_2 = Book.create(title: "Tiny Bugs")
user_1.books << book_3 = Book.create(title: "Carry On My Wayward Son")
user.books << book_4 = Book.create(title: "Badlands")
user.books << book_5 = Book.create(title: "Badlands 2")
user.books << book_4 = Book.create(title: "The Last Badlands")
genre = Genre.create("Romance")
genre = Genre.create("Slice of Life")
genre = Genre.create("Action")
