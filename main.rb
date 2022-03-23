require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/disc'
require_relative 'lib/product_collection'
require_relative 'lib/cart'

puts "Добро Пожаловать в наш магазин \"Добро Пожаловать!\""
collection = ProductCollection.from_dir("#{__dir__}/data")

cart = Cart.new
sum = 0

loop do
  collection.remove_out_of_stock!

  puts <<~COLLECTION
  Чего желаете?
  
  #{collection}
  0. Выход
  COLLECTION

  print '> '
  user_choice = STDIN.gets.to_i

  break if user_choice <= 0

  chosen_product = collection[user_choice]

  next if user_choice.nil? || user_choice > collection.to_a.size

  cart << chosen_product
  sum += chosen_product.price
  chosen_product.amount -= 1

  puts <<~SUBTOTAL
    Вы выбрали: #{chosen_product}
  
    Всего товаров на сумму: #{cart.total}
  SUBTOTAL
end

puts <<~TOTAL

Вы купили: 
#{cart}

С вас - $ #{cart.total}. Спасибо за покупки!
TOTAL
