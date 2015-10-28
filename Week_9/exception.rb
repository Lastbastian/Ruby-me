begin
  puts 1999 + "hey there"

rescue ZeroDivisionError => e
  puts "Exception: " + e.message + " at about line " + __LINE__.to_s + '<br>'
  puts  e.backtrace.join('<br>')
  puts "Hey Captain ZeroHero, you're not allowed to divide zero in this universe. Try again."
rescue Exception => e
  puts  e.message + "<br>"
  puts  e.backtrace.join("<br>")
else
  puts "No exceptions"
end


DATA.each do |data|
  data.chomp!
  puts(data + '!!! ')
end
__END__
this
is
the
output
of
the
data
that
follows
the
__END__
marker