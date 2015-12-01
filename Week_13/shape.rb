$:.push('.')
require 'my_math'
include MyMath

class Shape
  def initialize(x = 0, y = 0)
    @x = x
    @y = y
  end

  def location
    [@x, @y]
  end

  def to_s
    self.class.to_s + " class. " + "At location: #{@x} x #{@y}"
  end

  def self.create_shape(type)
    if type.downcase == :circle
      Shape::Circle.new
    elsif type.downcase == :rectangle
      Shape::Rectangle.new
    else
      Shape::Triangle.new
    end
  end

  class Circle < Shape
    attr_accessor :radius

    def initialize
      @radius = radius
    end

    def area
      area = (PI_CONST * @radius**2).round(2)
    end

    def to_s
       super.to_s + ", radius #{@radius}"
    end

  end

  class Rectangle < Shape
    attr_accessor :height, :width

    def initialize
      @height = height
      @width = width
    end

    def area
      area = (height * width).round(2)
    end

    def to_s
       super.to_s + ", height #{@height}, width #{@width}"
    end
  end

  class Triangle < Shape
    attr_accessor :height, :base

    def initialize
      @height = height
      @base = base
    end

    def area
      area = ((height * base) / 2).round(2)
    end

    def to_s
      super.to_s + ", height #{@height}, base #{@base}"
    end

  end

end

# TEST CODE

square = Shape.new(5,5)
puts square.to_s

circle = Shape.create_shape(:circle)
circle.radius = 100
puts circle.area

triangle = Shape.create_shape(:triangle)
triangle.height = 13
triangle.base = 13
puts triangle.area

rectangle = Shape.create_shape(:rectangle)
rectangle.height = 10
rectangle.width  = 13
puts rectangle.area
puts rectangle.inspect
