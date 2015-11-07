the_tempest = <<ARIEL
o, wonder!
how many goodly creatures are there here!
how beauteous mankind is! o brave new world,
that has such people in't.
ARIEL

def the_tempest.reverse
  # super calls the reverse method in the parent class
  # self.reverse would result in infinite recursion!
  super.reverse
  self.upcase
end

puts 'With the singleton method'
puts '-' * 30
puts the_tempest.reverse
puts
puts 'Without the singleton method'
puts '-' * 30
puts "A different string doesn't have the same reverse method.".reverse