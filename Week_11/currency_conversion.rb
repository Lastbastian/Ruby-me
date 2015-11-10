class Numeric
 # Values in dollars
 @@currencies = {'dollar' => 1.0, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
 def method_missing(method_id)
  singular_currency = method_id.to_s.gsub( /s$/, '')
   if @@currencies.has_key?(singular_currency)
     self * @@currencies[singular_currency]
   else
     super
   end
 end
 def in(method_id)
  other_currency = method_id.to_s.gsub( /s$/, '')
    self / @@currencies[other_currency]
 end
end

p 500.rupees
p 500.yen
p 500.euros
p 500.dollars

puts "5 Yen = %.2f rupees."   % 5.yen.in(:rupees)
puts "5 Euros = %.2f rupees." % 5.euros.in(:rupees)
puts "\$5 = %.2f rupees."     % 5.dollars.in(:rupees)
puts "\$5 = %.2f euros."      % 5.dollars.in(:euros)
puts "\$1 = %.2f euros."      % 1.dollar.in(:euros)