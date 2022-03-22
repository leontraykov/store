class Disc < Product
  attr_accessor :singer, :year, :genre, :album

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map { |l| l.chomp }

    self.new(
      album: lines[0],
      singer: lines[1],
      genre: lines[2],
      year: lines[3],
      price: lines[4],
      amount: lines[5]
    )
  end

  def initialize(params)
    super

    @genre = params[:genre]
    @singer = params[:singer]
    @year = params[:year]
    @album = params[:album]
  end

  def to_s
    "Альбом #{@singer} - «#{@album}», #{@genre}, #{@year}, #{super}"
  end

  def update(params)
    super

    @singer = params[:singer] if params[:singer]
    @year = params[:year] if params[:year]
    @genre = params[:genre] if params[:genre]
    @genre = params[:album] if params[:album]
  end
end

# require_relative 'product'
# class Disc < Product
#   attr_accessor :album, :title, :genre, :year

#   def initialize(params)
#     super
#     @album = params[:album]
#     @title = params[:title]
#     @genre = params[:genre]
#     @year = params[:year]
#   end
  
#   def to_s
#     "Диск: #{@album}. Исполнитель: #{@title}. Год: #{@year}. Жанр: #{@genre}. Цена: $#{@price}. На складе: #{@left_on_stock}"
#   end

#   def self.from_file(path)
#     disc_file = File.join(__dir__, "/..#{path}")
#     lines = File.readlines(disc_file, chomp: true) 
#     Disc.new(album: lines[0],  title: lines[1], genre: lines[2], year: lines[3], price: lines[4], left_on_stock: lines[5])
#   end
# end
