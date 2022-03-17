class Book < Product
  attr_accessor :title, :genre, :author

  def initialize(params)
    super
    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end
  
  def to_s
    "Книга: #{@title}. Автор: #{@author}. Жанр: #{@genre}. Цена: #{@price}. На складе: #{@left_on_stock}"
  end

  def self.from_file(path)
    book_file = File.join(__dir__, "/..#{path}")
    lines = File.readlines(book_file, chomp: true) 
    Book.new(title: lines[0],  genre: lines[1], author: lines[2], price: lines[3], left_on_stock: lines[4])
  end
end
