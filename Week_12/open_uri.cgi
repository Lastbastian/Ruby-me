#!/usr/local/bin/ruby
# Name: Chris Bastian
# File: open_uri.cgi
# ASSN: Week 12 Lab --- open-uri cgi script
# Desc: A script to work with open-uri.
$:.unshift File.dirname(__FILE__)

require 'cgi_helper'
include CgiHelper
require 'cgi'
require 'open-uri'

title = 'Week 12 Open-URI Script'

f = open('http://hills.ccsf.edu/~cbastian/cs132a/lab2.cgi')

cgi = CGI.new
puts cgi.header
puts
puts "<html>"
puts "<head>"
puts "<title>#{title}</title>"
puts "</head>"
puts "<body>"
puts "<blockquote>"
puts "<h2>Open-URI Script</h2>"
puts "#{f.readlines.join}"
puts "</body>"
puts "</html>"