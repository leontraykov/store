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

  # if chosen_product.amount == 0
  #   puts "Закончилось! Приходите через неделю или посмотрите еще раз на витрину, может..."
  #   next
  # end

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

# #{cart.sum(&:price)}



# until user_choice == -1
#   puts "Чего желаете?"
#   puts all_items
#   puts "0: Я просто посмотрю. И уйду."
#   puts
 

#   user_choice = STDIN.gets.to_i - 1

#   if all_items[user_choice].amount == 0
#     puts "Увы, всё раскупили, выберете, что-то другое, пожалуйста."
#   elsif !user_choice.between?(0, all_items.size) 
#     puts "Выберете правильный номер товарной позиции."
#   else
#     all_items[user_choice].amount -= 1
#     basket << all_items[user_choice]
#     puts "Вы купили: #{all_items[user_choice]}"
#     puts sum += all_items[user_choice].price 
#   end
# end
# puts "И так, вы выбрали:"
# basket.each_with_index { |item, index| puts "#{index +1}: #{item}" }
# puts "С вас $#{sum.round(2)}, пожалуйста."
