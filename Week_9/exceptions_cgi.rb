#!/usr/local/bin/ruby
# Add the current directory to the include path.
$:.unshift('.')
require 'cgi_helper'
require 'cgi'
include CGI_Helper
http_header

# Start the exception block
begin
  dividend = CGI.new.params['dividend'][0].to_i
  divisor = CGI.new.params['divisor'][0].to_i
  if divisor.nil?
    divisor = 1
  end
  puts (dividend.to_i / divisor.to_i)
  puts '<hr />'

  puts <<-FORM
<form action= method=post >
<label for=>Dividend</label> <input type=text name=dividend value=  /><br />
<label for=>Divisor</label> <input type=text name=divisor value=  /><br />
<input type=submit name=submit value=Submit />
</form>
  FORM
rescue ZeroDivisionError => e # handle dividing by zero
  puts '<div style=width:50%;margin:0 auto;background-color: #ff9;
    border: solid black 4px;padding: 2em;>'
  puts '<h3>This script has encountered a fatal error: ' + e.class.to_s + '</h3>'
  puts 'Divisor: ' + divisor.to_s + '<br />'
  puts 'Dividend: ' + dividend.to_s + '<br />'
  puts 'Error message: '  + e.message.capitalize + '<br />'
  puts e.backtrace.join('<br />')
  puts '</div>'
rescue Exception => e # generic exceptions caught here
  puts e.message
  puts e.backtrace.join('<br />')
end