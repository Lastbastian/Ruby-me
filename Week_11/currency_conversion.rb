class Numeric
 # Values in dollars
 @@currencies = {'dollar' => 1.0, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
 def method_missing(method_id, *args)
   singular_currency = method_id.to_s.gsub( /s$/, '')
   if @@currencies.has_key?(singular_currency)
     self * @@currencies[singular_currency]
   else
     super
   end
 end
end

puts 500.rupees
puts 500.yen
puts 500.euros
puts 500.dollars

puts 5.yen.in(:rupees)