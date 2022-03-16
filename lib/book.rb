class Book < Product
  def to_s
    "Книга: " + super
  end
end
