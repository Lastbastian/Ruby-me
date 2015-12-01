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

  # def self.create_shape(type)

  # end

  class Circle < Shape
    attr_accessor :radius

    def initialize
      @radius = radius
      super(x,y)
    end

    def area
      area = PI_CONST * @radius**2
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
      area = height * width
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
      super(x,y)
    end

    def area
      area = (height * base) / 2
    end

    def to_s
      super.to_s + ", height #{@height}, base #{@base}"
    end

  end

end


square = Shape.new(5,5)
s = Shape::Rectangle.new
p s.inspect
# circle = Shape.create_shape()
# p circle.area
