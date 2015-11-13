#!/usr/local/bin/ruby
# Name: Chris Bastian
# File: resolv.cgi
# ASSN: Week 12 Lab --- resolv cgi script
# Desc: Using hpricot and resolv to capture html.
ENV['GEM_HOME']='/students/cbastian/mygems'
$:.unshift File.dirname(__FILE__)

require 'rubygems'
require 'resolv'
require 'cgi'
cgi = CGI.new

output=''
domain_name = ''

if cgi.params['domain_name'].empty? or cgi.params['domain_name'][0] == ''
  output = "<div class='alert alert-info'>Enter a domain name to resolve to an IP address.</div>"
else
  domain_name =  CGI.escapeHTML(cgi.params['domain_name'][0])
  Resolv.each_address(domain_name) do |address|
    output += <div>address
  end
end

puts 'Content-type:text/html'
puts
puts <<FORM
<!doctype html>
<head>

</head>
  <form action="" method="post">
    <input type="text" name="domain_name" value="#{domain_name}">
    <input type="submit" name="submit" value='Submit'>
  </form>
  #{output}
FORM