$:.push('.')
require 'my_math'
include MyMath

class Shape
  def initialize(x, y)
    @x = x
    @y = y
  end

  def location
    [@x, @y]
  end

  def to_s
    "Shape class with corrdinates: #{@x} x #{@y}"
  end

  class Circle < Shape
    def area
      area = PI * radius**2
    end

  end

  class Rectangle < Shape
    def area
      area = length * width
    end
  end

  class Triangle < Shape
    def area
      area = (height * base) / 2
    end

  end

end


square = Shape.new(5,5)
p square.to_s
p square.location