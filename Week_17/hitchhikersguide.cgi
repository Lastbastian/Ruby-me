#!/usr/local/bin/ruby
# Name: Chris Bastian - peacethrubeats@gmail.com
# Date: 2015-12-20 Sunday
# File: hitchhikersguide.cgi
# Desc: Final Test Problem

puts "Content-type: text/html"
puts

require "open-uri"
string = ""
url = "/users/dputnam/greetings.txt"

open(url) do |content|
    content.each_line { |line| string += line }
end