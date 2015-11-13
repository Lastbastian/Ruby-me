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
require 'cgi_helper'
include CgiHelper

cgi = CGI.new

output=''
domain_name = ''

if cgi.params['domain_name'].empty? or cgi.params['domain_name'][0] == ''
  output = "Enter a domain name to resolve to an IP address."
else
  domain = cgi.params['domain_name'][0]
  output = domain + " resolves to the following IP address/es:" + "<br>"
  domain_name =  CGI.escapeHTML(cgi.params['domain_name'][0])
  Resolv.each_address(domain_name) do |address|
    output += "• " + h(address) + "<br>"
  end
end

puts 'Content-type:text/html'
puts
puts <<FORM
<!doctype html>
<head>

</head>
  <div>
    <form action="" method="post">
      <input type="text" name="domain_name" value="#{domain_name}">
      <input type="submit" name="submit" value='Submit'>
    </form>
  </div>
  <div>
    <p>
      #{output}
    </p>
  </div>
FORM