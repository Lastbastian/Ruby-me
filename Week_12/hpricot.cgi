#!/usr/local/bin/ruby
# Name: Chris Bastian
# File: hpricot.cgi
# ASSN: Week 12 Lab --- hpricot cgi script
# Desc: Using open-uri and hpricot to capture html.
$:.unshift File.dirname(__FILE__)
ENV['GEM_HOME']='/students/cbastian/mygems'

require 'cgi_helper'
include CgiHelper
require 'rubygems'
require 'cgi'
require 'open-uri'
require 'hpricot'

title = 'Week 12 hpricot cgi script'

f = open('http://apple.com/index.html')
html = Hpricot(f)
h1_reference = html.search("h1").first.inner_html
a_list = html.search("a")

cgi = CGI.new
puts cgi.header
puts
puts "<html>"
puts "<head>"
puts "<title>#{title}</title>"
puts "</head>"
puts "<body>"
puts "<blockquote>"
puts "<h1>#{title}</h1>"
puts "<h3>Use Use hpricot and and CgiHelper#h to safely print:</h3>"
puts "• The inner html of the first H1 element on Apple.com's home page (index.html).<br>"
puts "• The inner html of all of the A links on the Apple.com home page."
puts "<h2>The Inner HTML of the first H1 element.</h2>"
puts "<p>#{ h1_reference }</p>"
puts "<h2>The Inner HTML of all a elements.</h2>"
puts "<ul>"
count = 0
a_list.each do |element|
  puts "<li>" + h(element.inner_html.force_encoding('UTF-8')) + "</li>"
  count += 1
end
puts "</ul>"
puts "<h3>There are a total of #{count} a-href elements on this page.</h3>"
puts "</body>"
puts "</html>"