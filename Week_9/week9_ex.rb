

test = [0,1,2]

begin
  DATA.each do |data|
    data.chomp!
    puts eval(data)

  rescue ArgumentError => e
    puts "Exception: " + e.message
    puts e.backtrace.join("<br>\n")
    puts "Argument Error"
  rescue IndexError => e
    puts "Exception: " + e.message
    puts e.backtrace.join("<br>\n")
    puts "Index Error"
  rescue NameError => e
    puts "Exception: " + e.message
    puts e.backtrace.join("<br>\n")
    puts "Name error"
  rescue NoMethodError => e
    puts "Exception: " + e.message
    puts e.backtrace.join("<br>\n")
    puts "This method is undefined"
  rescue ZeroDivisionError => e
    puts "Exception: " + e.message
    puts  e.backtrace.join("<br>\n")
    puts "Cannot divide by zero"

  end
end

__END__

[1, 2, 3].first(4, 5)
test.fetch(4)
foo
"hello".weird_method
1/0