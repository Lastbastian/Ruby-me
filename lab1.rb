# !/usr/local/bin/ruby
# Name: Chris Bastian
# Date: 2015-9-08 Tuesday
# File: lab1.rb
# Desc: Various string functions

require "open-uri" # Use this library to do network requests
the_string = ""    # Initialize this string
the_url = "http://hills.ccsf.edu/~dputnam/the_string.cgi"

# Concatenate all of the lines into the_string for use later
open(the_url) do |content|
    content.each_line { |line| the_string += line }
end

# TEST CODE: Comment these lines after you finish testing your code
# puts
# puts "BEGIN TESTING"
# puts the_string                                  # Did we get the_string?
# puts "The size: #{the_string.size}"              # How long is the string?
# puts "Original encoding: #{the_string.encoding}" # What's the encoding?

# #If it's not UTF-8 we have to change it.
# if the_string.encoding.to_s != 'UTF-8'
#    puts '>>> Changing the encoding to Unicode'
#    encoded = the_string.encode('utf-8')         # Convert to Unicode
#    # Should be UTF-8 now. Check it.
#    puts "Encoding is: #{encoded.encoding}"      # Should now be UTF-8.
# end
# puts "END TESTING"
# END TEST CODE #

puts "\nSize: \n#{the_string.size}"
# output:
# 545

puts "* " * 10

puts "\nSqueeze: \n#{the_string.squeeze}"
# output:
# 0. "this String may change at any time. Wil your solution stil work?"
# 1. (by The way, this string has leading space and to 'MANY tabs and sPaCes betwenX')"
# 2. the IndiVidual Words in each Line.X
# 3. eacH Line ends with a acidentaly aDED X.X
# 4. -in This lab you wilL WRITE code that "sAnITizES" this string by normalizingX
# 5. ("nOrMaLiZiNg" Means capitalizing SENTENCES and seting otherXx
# 6. characterS To lower case) and removes the extra spaces betwen WOrds.X
# 7. xXx
# 8. xXx

puts "* " * 10

puts "\nDowncase: \n#{the_string.downcase}"
# output:
# 0. "this string may change at any time. will your solution still work?"
# 1.         (by the way, this       string has leading space and too    'many tabs and spaces betweenx')"
# 2.   the individual words in each line.x
# 3.  each line ends with a accidentally  added   x.xx
# 4.   ---in this lab you will write code that "sanitizes" this string by normalizingx
# 5.   ("normalizing" means   capitalizing sentences   and setting otherxx
# 6.  characters to lower case)     and removes         the extra spaces between words.x
# 7.              xxx
# 8.    xxx

puts "* " * 10

puts "\nUpcase: \n#{the_string.upcase}"
# output:
# 0. "THIS STRING MAY CHANGE AT ANY TIME. WILL YOUR SOLUTION STILL WORK?"
# 1.         (BY THE WAY, THIS       STRING HAS LEADING SPACE AND TOO    'MANY TABS AND SPACES BETWEENX')"
# 2.   THE INDIVIDUAL WORDS IN EACH LINE.X
# 3.  EACH LINE ENDS WITH A ACCIDENTALLY  ADDED   X.XX
# 4.   ---IN THIS LAB YOU WILL WRITE CODE THAT "SANITIZES" THIS STRING BY NORMALIZINGX
# 5.   ("NORMALIZING" MEANS   CAPITALIZING SENTENCES   AND SETTING OTHERXX
# 6.  CHARACTERS TO LOWER CASE)     AND REMOVES         THE EXTRA SPACES BETWEEN WORDS.X
# 7.              XXX
# 8.    XXX

puts "* " * 10

puts "\nRemove Ending X: \n#{the_string.gsub(/[xX]$/,'')}"
# output:
# 0. "this String may change at any time. Will your solution still work?"
# 1.         (by The way, this       string has leading space and too    'MANY tabs and sPaCes betweenX')"
# 2.   the IndiVidual Words in each Line.
# 3.  eacH Line ends with a accidentally  aDDED   X.X
# 4.   ---in This lab you wilL WRITE code that "sAnITizES" this string by normalizing
# 5.   ("nOrMaLiZiNg" Means   capitalizing SENTENCES   and setting otherX
# 6.  characterS To lower case)     and removes         the extra spaces between WOrds.
# 7.              xX
# 8.    xX

puts "* " * 10

the_string.each_byte { |b| print b.chr, b ,"0x",b.to_s(16)," | " }
# output:
# 0480x30 | .460x2e |  320x20 | "340x22 | t1160x74 | h1040x68 | i1050x69 | s1150x73 |  320x20 | S830x53 | t1160x74 | r1140x72 | i1050x69 | n1100x6e | g1030x67 |  320x20 | m1090x6d | a970x61 | y1210x79 |  320x20 | c990x63 | h1040x68 | a970x61 | n1100x6e | g1030x67 | e1010x65 |  320x20 | a970x61 | t1160x74 |  320x20 | a970x61 | n1100x6e | y1210x79 |  320x20 | t1160x74 | i1050x69 | m1090x6d | e1010x65 | .460x2e |  320x20 | W870x57 | i1050x69 | l1080x6c | l1080x6c |  320x20 | y1210x79 | o1110x6f | u1170x75 | r1140x72 |  320x20 | s1150x73 | o1110x6f | l1080x6c | u1170x75 | t1160x74 | i1050x69 | o1110x6f | n1100x6e |  320x20 | s1150x73 | t1160x74 | i1050x69 | l1080x6c | l1080x6c |  320x20 | w1190x77 | o1110x6f | r1140x72 | k1070x6b | ?630x3f | "340x22 |
# 100xa | 1490x31 | .460x2e |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 | (400x28 | b980x62 | y1210x79 |  320x20 | T840x54 | h1040x68 | e1010x65 |  320x20 | w1190x77 | a970x61 | y1210x79 | ,440x2c |  320x20 | t1160x74 | h1040x68 | i1050x69 | s1150x73 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 | s1150x73 | t1160x74 | r1140x72 | i1050x69 | n1100x6e | g1030x67 |  320x20 | h1040x68 | a970x61 | s1150x73 |  320x20 | l1080x6c | e1010x65 | a970x61 | d1000x64 | i1050x69 | n1100x6e | g1030x67 |  320x20 | s1150x73 | p1120x70 | a970x61 | c990x63 | e1010x65 |  320x20 | a970x61 | n1100x6e | d1000x64 |  320x20 | t1160x74 | o1110x6f | o1110x6f |  320x20 |  320x20 |  320x20 |  320x20 | '390x27 | M770x4d | A650x41 | N780x4e | Y890x59 |  320x20 | t1160x74 | a970x61 | b980x62 | s1150x73 |  320x20 | a970x61 | n1100x6e | d1000x64 |  320x20 | s1150x73 | P800x50 | a970x61 | C670x43 | e1010x65 | s1150x73 |  320x20 | b980x62 | e1010x65 | t1160x74 | w1190x77 | e1010x65 | e1010x65 | n1100x6e | X880x58 | '390x27 | )410x29 | "340x22 |
# 100xa | 2500x32 | .460x2e |  320x20 |  320x20 |  320x20 | t1160x74 | h1040x68 | e1010x65 |  320x20 | I730x49 | n1100x6e | d1000x64 | i1050x69 | V860x56 | i1050x69 | d1000x64 | u1170x75 | a970x61 | l1080x6c |  320x20 | W870x57 | o1110x6f | r1140x72 | d1000x64 | s1150x73 |  320x20 | i1050x69 | n1100x6e |  320x20 | e1010x65 | a970x61 | c990x63 | h1040x68 |  320x20 | L760x4c | i1050x69 | n1100x6e | e1010x65 | .460x2e | X880x58 |
# 100xa | 3510x33 | .460x2e |  320x20 |  320x20 | e1010x65 | a970x61 | c990x63 | H720x48 |  320x20 | L760x4c | i1050x69 | n1100x6e | e1010x65 |  320x20 | e1010x65 | n1100x6e | d1000x64 | s1150x73 |  320x20 | w1190x77 | i1050x69 | t1160x74 | h1040x68 |  320x20 | a970x61 |  320x20 | a970x61 | c990x63 | c990x63 | i1050x69 | d1000x64 | e1010x65 | n1100x6e | t1160x74 | a970x61 | l1080x6c | l1080x6c | y1210x79 |  320x20 |  320x20 | a970x61 | D680x44 | D680x44 | E690x45 | D680x44 |  320x20 |  320x20 |  320x20 | X880x58 | .460x2e | X880x58 | X880x58 |
# 100xa | 4520x34 | .460x2e |  320x20 |  320x20 |  320x20 | -450x2d | -450x2d | -450x2d | i1050x69 | n1100x6e |  320x20 | T840x54 | h1040x68 | i1050x69 | s1150x73 |  320x20 | l1080x6c | a970x61 | b980x62 |  320x20 | y1210x79 | o1110x6f | u1170x75 |  320x20 | w1190x77 | i1050x69 | l1080x6c | L760x4c |  320x20 | W870x57 | R820x52 | I730x49 | T840x54 | E690x45 |  320x20 | c990x63 | o1110x6f | d1000x64 | e1010x65 |  320x20 | t1160x74 | h1040x68 | a970x61 | t1160x74 |  320x20 | "340x22 | s1150x73 | A650x41 | n1100x6e | I730x49 | T840x54 | i1050x69 | z1220x7a | E690x45 | S830x53 | "340x22 |  320x20 | t1160x74 | h1040x68 | i1050x69 | s1150x73 |  320x20 | s1150x73 | t1160x74 | r1140x72 | i1050x69 | n1100x6e | g1030x67 |  320x20 | b980x62 | y1210x79 |  320x20 | n1100x6e | o1110x6f | r1140x72 | m1090x6d | a970x61 | l1080x6c | i1050x69 | z1220x7a | i1050x69 | n1100x6e | g1030x67 | X880x58 |
# 100xa | 5530x35 | .460x2e |  320x20 |  320x20 |  320x20 | (400x28 | "340x22 | n1100x6e | O790x4f | r1140x72 | M770x4d | a970x61 | L760x4c | i1050x69 | Z900x5a | i1050x69 | N780x4e | g1030x67 | "340x22 |  320x20 | M770x4d | e1010x65 | a970x61 | n1100x6e | s1150x73 |  320x20 |  320x20 |  320x20 | c990x63 | a970x61 | p1120x70 | i1050x69 | t1160x74 | a970x61 | l1080x6c | i1050x69 | z1220x7a | i1050x69 | n1100x6e | g1030x67 |  320x20 | S830x53 | E690x45 | N780x4e | T840x54 | E690x45 | N780x4e | C670x43 | E690x45 | S830x53 |  320x20 |  320x20 |  320x20 | a970x61 | n1100x6e | d1000x64 |  320x20 | s1150x73 | e1010x65 | t1160x74 | t1160x74 | i1050x69 | n1100x6e | g1030x67 |  320x20 | o1110x6f | t1160x74 | h1040x68 | e1010x65 | r1140x72 | X880x58 | x1200x78 |
# 100xa | 6540x36 | .460x2e |  320x20 |  320x20 | c990x63 | h1040x68 | a970x61 | r1140x72 | a970x61 | c990x63 | t1160x74 | e1010x65 | r1140x72 | S830x53 |  320x20 | T840x54 | o1110x6f |  320x20 | l1080x6c | o1110x6f | w1190x77 | e1010x65 | r1140x72 |  320x20 | c990x63 | a970x61 | s1150x73 | e1010x65 | )410x29 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 | a970x61 | n1100x6e | d1000x64 |  320x20 | r1140x72 | e1010x65 | m1090x6d | o1110x6f | v1180x76 | e1010x65 | s1150x73 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 | t1160x74 | h1040x68 | e1010x65 |  320x20 | e1010x65 | x1200x78 | t1160x74 | r1140x72 | a970x61 |  320x20 | s1150x73 | p1120x70 | a970x61 | c990x63 | e1010x65 | s1150x73 |  320x20 | b980x62 | e1010x65 | t1160x74 | w1190x77 | e1010x65 | e1010x65 | n1100x6e |  320x20 | W870x57 | O790x4f | r1140x72 | d1000x64 | s1150x73 | .460x2e | X880x58 |
# 100xa | 7550x37 | .460x2e |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 |  320x20 | x1200x78 | X880x58 | x1200x78 |
# 100xa | 8560x38 | .460x2e |  320x20 |  320x20 |  320x20 |  320x20 | x1200x78 | X880x58 | x1200x78 |

puts "* " * 10

puts "\nSplit: \n#{the_string.split()}"
# output:
# ["0.", "\"this", "String", "may", "change", "at", "any", "time.", "Will", "your", "solution", "still", "work?\"", "1.", "(by", "The", "way,", "this", "string", "has", "leading", "space", "and", "too", "'MANY", "tabs", "and", "sPaCes", "betweenX')\"", "2.", "the", "IndiVidual", "Words", "in", "each", "Line.X", "3.", "eacH", "Line", "ends", "with", "a", "accidentally", "aDDED", "X.XX", "4.", "---in", "This", "lab", "you", "wilL", "WRITE", "code", "that", "\"sAnITizES\"", "this", "string", "by", "normalizingX", "5.", "(\"nOrMaLiZiNg\"", "Means", "capitalizing", "SENTENCES", "and", "setting", "otherXx", "6.", "characterS", "To", "lower", "case)", "and", "removes", "the", "extra", "spaces", "between", "WOrds.X", "7.", "xXx", "8.", "xXx"]

puts "* " * 10

puts "\nCrypt: \n#{the_string.crypt("aa")}"
# output:
# aah1Lb7Lysqe2

puts "* " * 10
puts "\nCapitalize:"
hash = {"a"=>"A","b"=>"B","c"=>"C","d"=>"D","e"=>"E","f"=>"F","g"=>
  "G","h"=>"H","i"=>"I","j"=>"J","k"=>"K","l"=>"L","m"=>"M","n"=>"N","o"=>"O","p"=>"P","q"=>"Q","r"=>"R","s"=>"S","t"=>"T","u"=>"U","v"=>"V","w"=>"W","x"=>"X","y"=>"Y","z"=>"Z"}
the_string.each_line{ |line| p line.sub(/([a-zA-Z])/,hash) }
# output:
# "0. \"This String may change at any time. Will your solution still work?\"\n"
# "1.         (By The way, this       string has leading space and too    'MANY tabs and sPaCes betweenX')\"\n"
# "2.   The IndiVidual Words in each Line.X\n"
# "3.  EacH Line ends with a accidentally  aDDED   X.XX\n"
# "4.   ---In This lab you wilL WRITE code that \"sAnITizES\" this string by normalizingX\n"
# "5.   (\"NOrMaLiZiNg\" Means   capitalizing SENTENCES   and setting otherXx\n"
# "6.  CharacterS To lower case)     and removes         the extra spaces between WOrds.X\n"
# "7.              XXx\n"
# "8.    XXx"

puts "* " * 10

puts "\nReplace - Object ID: #{the_string.object_id}"
# output:
# 70143548358360

puts "\nReplace - String: \n #{the_string.replace(the_string[0..99].strip.reverse.squeeze.upcase)}"
# output:
#  H GNIRTS SIHT .1
# ?KROW LITS NOITULOS RUOY LIW .EMIT YNA TA EGNAHC YAM GNIRTS SIHT .0

puts "\nReplace - Object ID Again: #{the_string.object_id}"
# output:
# 70143548358360

puts "* " * 10

puts "\nInspect: \n#{the_string.inspect}"
# output:
# "SIHT ,YAW EHT YB( .1\n\"?KROW LITS NOITULOS RUOY LIW .EMIT YNA TA EGNAHC YAM GNIRTS SIHT\" .0"