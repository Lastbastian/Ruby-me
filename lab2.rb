# !/usr/local/bin/ruby
# Name: Chris Bastian - peacethrubeats@gmail.com
# Date: 2015-9-11 Friday
# File: lab2.rb
# Desc: Problem set about Ruby Array methods

require "open-uri"
the_string = ""
the_url = "http://hills.ccsf.edu/~dputnam/the_string.cgi"

open(the_url) do |content|
    content.each_line { |line| the_string += line }
end
puts "* " * 10
# 3.1
puts "\nArray - all characters: \n#{the_string.split('')}" ""
puts "* " * 10
# 3.2
original_array = the_string.split('')
arr1 = original_array[0..(original_array.count / 3)]
arr2 = original_array[(original_array.count / 3) + 1 .. -1]
# 5.1
puts "\nArray - contents of arr1: \n#{arr1}"
puts "* " * 10
# 5.2
puts "\nArray - contents of arr2: \n#{arr2}"
puts "* " * 10
# 5.3
array_common = original_array.uniq
puts "\nArray - Common Elements with no dupes: \n #{array_common}"
puts "* " * 10
# 5.4
array_difference1 = arr1 - arr2
puts "\nArray - Difference #1: \n#{array_difference1}"
puts "* " * 10
# 5.5
array_difference2 = arr2 - arr1
puts "\nArray - Difference #2: \n#{array_difference2}"
puts "* " * 10
# 5.6
array1_last = arr1[-1]
array2_last = arr2[-1]
puts "\nArray1 - last element: \n"
p array1_last

puts "\nArray2 - last element: \n"
p array2_last
puts "* " * 10

# 5.7
array1_first = arr1.first
puts "\nArray1 - first element: \n"
p array1_first

array2_first = arr2.first
puts "\nArray2 - first element: \n"
p array2_first
puts "* " * 10

# 5.8
mod_array = []
arr2.each { |element| mod_array << element.upcase unless element == " " }
puts "\nArray - remove blanks and uppercase: \n#{mod_array}"

arr1.insert(100, arr2)
puts "\nArray - insert arr2 into arr1: \n#{arr1}"

puts "* " * 10

# 5.9
array1_flatten = arr1.flatten!
array1_flatten_ns = array1_flatten.keep_if { |e| e != " "}
puts "\nArray - flatten and delete whitespace: \n #{array1_flatten_ns}"

puts "* " * 10

# 5.10
puts "\nArray - collect: \n"
arr1.collect { |element| p element + "!"}

puts "* " * 10

# 5.11
array_popped = arr1.pop
puts "\nArray - pop: \n #{array_popped}"
puts "\nArray1: \n #{arr1}"

puts "* " * 10

# 5.12
puts "\nArray - unshift: \n #{arr1.unshift(array_popped)}"

puts "* " * 10

# 5.13
array_uppercase = []
arr1.select! { |element| array_uppercase << element if element == element.upcase && element.match(/^[[:alpha:]]$/) }
puts "\nArray - select: \n #{array_uppercase}"