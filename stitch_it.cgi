#!/usr/local/bin/ruby
# Name: Chris Bastian
# File: stitch_it.cgi
# ASSN: Week 3 exercises --- CGI Scripts

puts "Content-type: text/html"
puts


title = 'Stitch It CGI'
head = File.read('head.html')
footer = File.read('footer.html')

puts "#{head}"
puts "#{footer}"

