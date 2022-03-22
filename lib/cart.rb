class Cart
  def initialize
    @products = []
  end

  def total
    @products.sum(&:price).round(2)
  end

  def <<(new_product)
    @products << new_product
  end

  def to_s
    @products.tally.map.with_index(1) { |(product, quantity), index| "#{index}. #{product} - #{quantity} шт." }.join("\n")
    # @products.join("\n")
  end
end
