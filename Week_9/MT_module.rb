module Friendly
  def interact
    print "What's your name? "
    name = gets.chomp
    puts "Hello, #{name}"
  end
end

interact