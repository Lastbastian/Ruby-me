#!/usr/local/bin/ruby
# Name: Chris Bastian
# File: hello_world.cgi
# ASSN: Week 3 exercises --- CGI Scripts
# Desc: A proof of concept CGI script

# Print the media type. This one is an HTML page
# If you are printing plain text, use text/plain instead of text/html
puts "Content-type: text/html"
puts # This blank line is mandatory

# Start printing the HTML
# Notice that this script uses "HEREDOC" quoting.

# A variable that will be printed using interpolation
title = 'A First Ruby Script'

puts <<HTML
<!DOCTYPE html>
<html>
<head>
<title>#{title}</title>
</head>
<body>
<h1>Hello, world!</h1>
<p> This is an example of a Ruby CGI script. It has the following features. </p>
<ul>
<li>A shebang line</li>
<li>A MIME type (<code>text/html</code>)</li>
<li>A blank line after the Content-type line.</li>
<li>Correct permissions: 700</li>
<li>Some HTML to format the text</li>
</ul>
</body>
</html>
HTML