#!/usr/local/bin/ruby
# Name: Chris Bastian
# File: oliver_twist.cgi
# ASSN: Week 3 exercises --- CGI Scripts
# Desc: An Oliver Twist CGI script.
title = 'Oliver Twist Script'

content = File.read('oliver.txt')
content_encoded = content.encode('utf-8')

puts "Content-type: text/html"
puts
puts "<html>"
puts "<head>"
puts "<title>#{title}</title>"
puts "</head>"
puts "<body>"
puts "<blockquote>"
puts "<h2>Oliver Twist</h2>"
puts "#{content_encoded}"
puts "</body>"
puts "</html>"

