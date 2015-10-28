require 'erb'

# Create a new ERB instance and pass it text containg ERB tags
erb = ERB.new('<% first_name = "Joseph" %> Joe Sixpack\'s first name is <%= first_name %>. For real.')

# Display the generated output
puts erb.result # generates the output