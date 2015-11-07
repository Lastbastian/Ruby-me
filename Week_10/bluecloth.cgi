#!/usr/local/bin/ruby
# Name: Chris Bastian
# File: oliver_twist.cgi
# ASSN: Week 3 exercises --- CGI Scripts
# Desc: An Oliver Twist CGI script. 
ENV['GEM_HOME']='/students/cbastian/mygems'
require 'rubygems'
require 'bluecloth'
require 'cgi'

markdown = File.read('markdown.txt')

cgi = CGI.new
puts cgi.header
puts html = BlueCloth.new(markdown).to_html
