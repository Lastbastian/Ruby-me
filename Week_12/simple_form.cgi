#!/usr/local/bin/ruby
ENV['GEM_HOME']='/students/cbastian/mygems'
$:.unshift('.')
require 'rubygems'
require 'markaby'
require 'resolv'
require 'cgi_helper'
require 'cgi'
require 'erb'
cgi = CGI.new
output = nil
user_name = nil
error = nil
#################### PROCESS THE FORM #########################
#
# cgi.params has all of the GET and POST variables
#
if ENV['REQUEST_METHOD'] == 'GET'
    output = nil
    showme_css = 'none'
    hideme_css = 'block'
else
  # If this is a POST request (user submitted the form)
  if ENV['REQUEST_METHOD'] == 'POST'
    if cgi.params['user_name'].empty? or cgi.params['user_name'][0] == ''
      error = "Enter a valid user_name name."
    else
      user_name =  CGI.escapeHTML(cgi.params['user_name'][0])
      output = "<h1 style='font-size: 128px;word-wrap:break-word'>Hello, #{user_name}! You are awesome!</h1>"
      showme_css = 'block'
      hideme_css = 'none'
    end
  end
end
#################### ERB TEMPLATE #########################
html = <<ERB
Content-type:text/html
<!doctype html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>user_name to IP using Resolv</title>
    <link rel="stylesheet" href="/~dputnam/assets/stylesheets/bootstrap.min.css">
    <style>.show_me {display:<%= showme_css %>}.hide_me {display:<%= hideme_css %>} body {padding:50px;font-size:18px}.pi {font-family: 'Arial', "Times New Roman", Times, serif;}</style>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-md-10 col-md-1-offset">
<% if output %>
  <div class="jumbotron show_me alert-success">
    <h1><%= output %></h1>
  </div>
<% else %>
  <div class="jumbotron hide_me">
    <h1>Say my name</h1>
    <p>We all love to hear our name. Enter your name into the form and I'll say in really BIG text. You know you'll love it!</p>
  </div>
<% end %>
  </div>
  </div>
  <div class="row">
      <div class="col-md-10 col-md-1-offset">
     <form action="" method="post">
          <span class="user_name">Your awesome name </span> <input type="text" name="user_name" value="<%= user_name %>">
        <input type="submit" name="submit" value='Say my name!'>
     </form>
      </p>
      <p><a href="http://hills.ccsf.edu/~dputnam/tests/ruby_solutions.cgi?course=cs132a&file=simple_form.cgi&week=10">View the source code</a></p>
  </div>
</div>
<% if error %>
<div class="row">
  <div class="col-md-8 col-md-2-offset alert alert-danger">
   <%= error %>
  </div>
</div>
<% end %>
</body>
ERB
erb = ERB.new(html)
puts erb .result(binding)