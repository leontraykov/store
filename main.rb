require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/movie'

leon = Movie.new(item_name: "Leon", price: "$19.99", left_on_stock: 15)
puts leon

island = Book.new(item_name: "Treasure Island", price: "$14.99", left_on_stock: 4)
puts island

afonya = Movie.new(price: "бесценно", item_name: "Афоня")
puts afonya

amber = Book.new(price: 30)
puts amber