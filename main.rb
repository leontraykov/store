require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'

film = Film.from_file('/data/films/01.txt')
book = Book.from_file('/data/books/01.txt')
puts book
puts film

begin
  Product.from_file('/data/films/01.txt')
rescue NotImplementedError
  puts 'Метод класса Product.from_file не реализован'
end