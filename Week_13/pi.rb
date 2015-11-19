# adds current dir to ruby search path
$:.push('.')

# require my_math.rb
require 'my_math'
# include the module into the main scope
include MyMath

print_pi
print_indiana_pi
puts MyMath::Pi
puts MyMath::IndianaPi

class MyMathClass
  # Mixin the attributes of MyMath module
  include MyMath
end

puts MyMathClass::Pi
puts MyMathClass::IndianaPi
m = MyMathClass.new
m.print_pi
m.print_indiana_pi