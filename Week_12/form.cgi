#!/usr/local/bin/ruby
require 'cgi'
cgi = CGI.new
output=''
pi = ''
show_source = nil
#
# cgi.params has all of the GET and POST variables
#
if cgi.params['pi'].empty? or cgi.params['pi'][0] == ''
   output = "<div class='alert alert-info'>Enter the value of <span class='pi'>&Pi;</span> to 20 digits to see the source code. You can find it <a href='http://www.wolframalpha.com/input/?i=pi+to+20+digits' style='border-bottom:dotted 1px blue'> at Wolfram </a>
   or by digging through the
   <a href=\"view-source:http://hills.ccsf.edu/~dputnam/cs132a/form.cgi\" style='border-bottom:dotted 1px blue'>HTML source code.</a></div>"
else
   if cgi.params['pi'][0] =~ /script/i
        puts "Location: http://apple.com"
        puts
        exit
   end
   pi =  CGI.escapeHTML(cgi.params['pi'][0])
   # From WolframAlpha: 3.1415926535897932385
   if pi == '3.1415926535897932385'
       output = "<h1 style='color:#0a0'>Success!</h1>"
       output += "<p>Here's that source code.</p>"
       show_source = true
   else
       output = "<h3 style=\"color:#a00\">Sorry:    <span class='pi'>&Pi;</span> to 20 digits is not #{pi}. Try again</h3>"
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
    <style>.pi {font-family: 'Nimbus Roman No9 L', "Times New Roman", Times, serif;}</style>
</head>
<div class="container">
<div class="row">
    <div class="col-md-8 col-md-2-offset">
   <h2>Example Ruby Form-processing CGI Script</h2>
   #{output}
    <p>
   <form action="" method="post">
        <span class="pi">&Pi;</span> to 20 digits <input type="text" name="pi" value="#{pi}">
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