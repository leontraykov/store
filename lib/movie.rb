require_relative 'product'
class Movie < Product
  attr_accessor :title, :director, :premiere
  def initialize(params)
    super
    @title = params[:title]
    @director = params[:director]
    @premiere = params[:premiere]
  end

  def to_s
    "Фильм: #{@title}. Режиссёр: #{@director}. Год: #{@premiere}. Цена: #{@price}. На складе: #{@left_on_stock}"
  end

  def self.from_file(path)
    movie_file = File.join(__dir__, "/..#{path}")
    lines = File.readlines(movie_file, chomp: true) 
    Movie.new(title: lines[0],  director: lines[1], premiere: lines[2], price: lines[3], left_on_stock: lines[4])
  end
end
