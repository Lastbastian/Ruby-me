#!/usr/local/bin/ruby
# Name: Chris Bastian
# File: oliver_twist.cgi
# ASSN: Week 12 Lab --- hpricot cgi script
# Desc: Using open-uri and hpricot to capture html.
require 'rubygems'
require 'cgi'
require 'open-uri'
require 'hpricot'

title = 'Week 12 hpricot cgi script'

f = open('http://apple.com/index.html')

cgi = CGI.new
puts cgi.header
puts
puts "<html>"
puts "<head>"
puts "<title>#{title}</title>"
puts "</head>"
puts "<body>"
puts "<blockquote>"
puts "<h2>Open-URI</h2>"
puts "#{f.readlines.join}"
puts "</body>"
puts "</html>"