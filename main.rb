class Product
  def initialize(name, price, left_on_stock)
    @name = name
    @price = price
    @left_on_stock = left_on_stock
  end
  attr_accessor :price, :on_stock
  def to_s
    "#{@name}. Цена: #{@price}. На складе: #{@left_on_stock}"
  end
end

class Movie < Product
end

class Book < Product

end

leon = Movie.new("Leon", "$19.99", 15)
puts leon
