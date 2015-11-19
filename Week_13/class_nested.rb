class Shape

  def initialize(x,y)
    @x = x
    @y = y
  end

  def location
    [@x, @y]
  end

  def to_s
    self.class.to_s + " #{@x} x #{@y}"
  end

  class Circle < Shape

    attr_accessor :radius

    def initialize(radius, x, y)
      @radius = radius
      super(x,y)
    end

  end

  def create_circle(radius, x, y)
    Circle.new(radius, x, y)
  end
end


c = Shape::Circle.new(100,100,100)
x,y = c.location
puts "Circle, radius #{c.radius}, located at #{x}x#{y}!"

s = Shape.new(0,0)
puts "Create a circle within the Shape class."
circle = s.create_circle(1000, 500, 500)
puts circle

