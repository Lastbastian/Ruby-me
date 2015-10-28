#!/usr/local/bin/ruby
# Name: Chris Bastian - peacethrubeats@gmail.com
# Date: 2015-9-11 Friday
# File: lab2.rb
# Desc: Problem set about Ruby Array methods

puts "Content-type: text/html"
puts


title = 'Lab 2 - Arrays'

require "open-uri"
the_string = ""
the_url = "http://hills.ccsf.edu/~dputnam/the_string.cgi"

open(the_url) do |content|
    content.each_line { |line| the_string += line }
end
# Ruby pre-html evaluation

# 3.2
original_array = the_string.split('')

arr1 = original_array[0..original_array.count/3]
arr2 = original_array[(original_array.count / 3) + 1 .. -1]

# 5.4
array_difference1 = arr1 - arr2

# 5.5
array_difference2 = arr2 - arr1

# 5.7
array1_first = arr1.first

# 5.8
mod_array = []
arr2.each { |element| mod_array << element.upcase unless element == " " }
array1_insert = arr1.insert(100, arr2)

# 5.9
array1_flatten = arr1.flatten.keep_if { |element| element != " " }

# 5.10
array1_collect = arr1.flatten.collect { |element| p element + "!"}

# 5.13
array_uppercase = []
array1_selected = array1_flatten.select { |element| array_uppercase << element if element == element.upcase && element.match(/^[[:alpha:]]$/) }


puts <<HTML
<!DOCTYPE html>
<html>
  <head>
  <title>#{title}</title>
  </head>
  <body>
    <p>
      3.1 - all characters:<br>
      #{the_string.split('')}
    </p>

    <p>
      5.1 - contents of arr1:<br>
      #{arr1}
    </p>

    </p>
      5.2 - contents of arr2:<br>
      #{arr2}
    </p>

    <p>
      5.3 - common elements with no dupes:<br>
      #{original_array.uniq}
    </p>

    <p>
      5.4 - array difference 1:<br>
      #{array_difference1}
    </p>

    <p>
      5.5 - array difference 2:<br>
      #{array_difference2}
    </p>

    <p>
      5.6 - last elements:<br>
      arr1 = "#{arr1[-1]}"
      <br>
      arr2 = "#{arr2[-1]}"
    </p>

    <p>
      5.7 - first elements<br>
      arr1 = "#{arr1.first.to_s}"
      <br>
      arr2 = "#{arr2.first.to_s}"
    </p>

    <p>
      5.8 - remove blanks and uppercase:<br>
      #{mod_array}
      <br>

      insert arr2 into arr1:<br>
      #{array1_insert}
    </p>

    <p>
      5.9 - flatten and delete whitespace:<br>
      #{array1_flatten}
    </p>

    <p>
      5.10 - collect:<br>
      #{array1_collect}
    </p>

    <p>
      5.11 - pop:<br>
      pop:
      "#{array1_flatten.pop}"<br>
      arr1:
      #{array1_flatten}
    </p>

    <p>
      5.12 - unshift:<br>
      #{array1_flatten.unshift(".")}
    </p>

    <p>
    5.13 - select:<br>
    #{array1_selected}
    </p>

  </body>
</html>
HTML
