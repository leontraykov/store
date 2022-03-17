class Product
  attr_accessor :price, :left_on_stock

  def initialize(params)
    @price = params[:price]
    @left_on_stock = params[:left_on_stock]
  end

  def self.from_file(path)
    raise NotImplementedError
  end
end

