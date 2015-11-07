#!/usr/local/bin/ruby
# Name: Chris Bastian
# File: dangerous.cgi
# ASSN: Week 10 Lab
# Desc: A script to work with threads.
# require 'cgi'

# cgi = CGI.new

threads = []
alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
results = []

10.times do |i|
  thread = Thread.new(i) do
    alphabet.each_char { |char| results << char + ":" + i.to_s; $stdout.flush; sleep 0.00001 }
  end

  threads << thread
end

puts results
