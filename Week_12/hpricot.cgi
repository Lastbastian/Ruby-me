#!/usr/local/bin/ruby
# Name: Chris Bastian
# File: oliver_twist.cgi
# ASSN: Week 12 Lab --- hpricot cgi script
# Desc: Using open-uri and hpricot to capture html.
require File.expand_path(File.dirname(__FILE__) + '/cgi_helper')

# require 'cgi_helper'
include CgiHelper
require 'rubygems'
require 'cgi'
require 'open-uri'
require 'hpricot'

title = 'Week 12 hpricot cgi script'

f = open('http://apple.com/index.html')
html = Hpricot(f)
h1_reference = html.search("h1").first.inner_html
a_reference = html.search("<a>").inner_html

# cgi = CGI.new
# puts cgi.header
puts
puts "<html>"
puts "<head>"
puts "<title>#{title}</title>"
puts "</head>"
puts "<body>"
puts "<blockquote>"
puts "#{h1_reference}"
puts "#{a_reference}"
puts "</body>"
puts "</html>"