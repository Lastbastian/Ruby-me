#!/usr/local/bin/ruby
# Name: Chris Bastian
# File: dangerous.cgi
# ASSN: Week 10 Lab
# Desc: A script to see if input is tainted.
require 'cgi'

cgi = CGI.new

output=''
pi = ''

def code_is_safe?(code)
  code =~ /[><"'`;*-]/ ? false : true
end

if cgi.params['pi'].empty? or cgi.params['pi'][0] == ''
   output = "<div class='alert alert-info'>Enter pi to 20 digits.</div>"
else
   if cgi.params['pi'][0] =~ /script/i
        puts "Location: http://apple.com"
        puts
        exit
   end
   pi =  CGI.escapeHTML(cgi.params['pi'][0])

   if pi == '3.1415926535897932385'
       output = "<h1 style='color:#0a0'>Success</h1>"
   else
       output = "<h3 style=\"color:#a00\">Sorry: PI to 20 digits is not #{pi}. Try again</h3>"
   end
   if code_is_safe?(pi)
    output += "<h2 style='color:#0a0'>Input is safe.</h1>"
    output += "Your input = " + pi
   else
    output += "<h2 style='color:#FF0000'>Input is unsafe</h3>"
    output += "Your input = " + pi
   end
end

puts 'Content-type:text/html'
puts

puts <<FORM
<!doctype html>
<head>
    <meta charset="utf-8">
    <title>Example Ruby Form-processing CGI Script</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
</head>
<div class="container">
<div class="row">
    <div class="col-md-8 col-md-2-offset">
   <h2>Ruby Form-processing CGI Script</h2>

   #{output}
    <p>
   <form action="" method="post">
      PI to 20 digits <input type="text" name="pi" value="#{pi}">
      <input type="submit" name="submit" value='Evaluate!'>
   </form>
    </p>
FORM

all_names = []
File.readlines('names.data').reverse.each do |name|
   parts = name.split('^')
    all_names << [parts[0], parts[1]]
end
#puts "<table>"
#all_names.each do |i|
#puts "<tr><td>" + i.join('</td><td>')  + "</td></tr>"
#end
#puts "</table>"
puts "</div></div></div>"

if show_source
   puts "<div class='row'><div class='twelve columns'>"
   puts '<div class="container"><hr><h1>Source: <code>form.cgi</code></h1><pre>'
   puts CGI::escapeHTML(File.read('form.cgi'))
   puts '</pre>'
   print '</div></div></div>'
end