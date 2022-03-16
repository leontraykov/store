class Product
  attr_accessor :item_name, :price, :on_stock

  def initialize(params)
    @item_name = params[:item_name]
    @price = params[:price]
    @left_on_stock = params[:left_on_stock]
  end

  def to_s
    "#{@item_name}. Цена: #{@price}. На складе: #{@left_on_stock}"
  end
end