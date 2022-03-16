class Movie < Product
  def to_s
    "Фильм: " + super
  end
end
