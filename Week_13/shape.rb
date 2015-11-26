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
    self.class.to_s + "#{@x} x #{@y}"
  end

  def create_shape(shape)
    puts "Hey"

  end

  class Circle < Shape
    attr_accessor :radius

    def initialize(radius, x, y)
      @radius = radius
    end

    def area
      area = PI_CONST * radius**2
    end

    def to_s
      super(x,y)
    end

  end

  class Rectangle < Shape
    attr_accessor :length, :width

    def initialize(length, width)
      @length = length
      @width = width
    end

    def area
      area = length * width
    end

    def to_s
      super(x,y)
    end
  end

  class Triangle < Shape
    attr_accessor :height, :base

    def initialize(height, base)
      @height = height
      @base = base
    end

    def area
      area = (height * base) / 2
    end

    def to_s

      super(x,y)
    end

  end

end


square = Shape.new(5,5)
p square.to_s
p square.location

triangle = Shape.create_shape(:triangle)

# s = Shape.new(1,1)