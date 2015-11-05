#!/usr/local/bin/ruby
# Name: Chris Bastian
# File: dangerous.cgi
# ASSN: Week 10 Lab
# Desc: A script to see if input is tainted.
require 'cgi'

cgi = CGI.new

output=''
pi = ''
empty_submission = nil

def code_is_safe?(code)
  code =~ /[`;*-]/ ? false : true
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
       output = "<h1 style='color:#0a0'>success</h1>"
   else
       output = "<h3 style=\"color:#a00\">Sorry: PI to 20 digits is not #{pi}. Try again</h3>"
   end
end

puts 'Content-type:text/html'
puts

puts <<FORM
<!doctype html>
<head>
    <meta charset="utf-8">
    <title>Example Ruby Form-processing CGI Script</title>
    <link rel="stylesheet" href="/~dputnam/assets/stylesheets/bootstrap.min.css">
</head>
<div class="container">
<div class="row">
    <div class="col-md-8 col-md-2-offset">
   <h2>Example Ruby Form-processing CGI Script</h2>

   #{output}
    <p>
   <form action="" method="post">
      PI to 20 digits <input type="text" name="pi" value="#{pi}">
      <input type="submit" name="submit" value='PI me!'>
   </form>
    </p>
    <div style="display:none">3.1415926535897932385</div>
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