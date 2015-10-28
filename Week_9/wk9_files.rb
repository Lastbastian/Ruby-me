directory = ARGF.argv

Dir.entries(directory.join).each { |file| puts file }