#!/usr/local/bin/ruby
# Name: Chris Bastian
# Crs : CS 132A
# Sect: 831
# File: week5_ex.rb
# Desc: Week Five Exercies on Hashes

# 10.1 TODO palindrome() =========================

def palindrome(string)
  string.downcase.split(/\W+/).join('') == string.downcase.split(/\W+/).join('').reverse
end

# test code

p palindrome("Dennis, Nell, Edna, Leon, Nedra, Anita, Rolf, Nora, Alice, Carol, Leo, Jane, Reed, Dena, Dale, Basil, Rae, Penny, Lana, Dave, Denny, Lena, Ida, Bernadette, Ben, Ray, Lila, Nina, Jo, Ira, Mara, Sara, Mario, Jan, Ina, Lily, Arne, Bette, Dan, Reba, Diane, Lynn, Ed, Eva, Dana, Lynne, Pearl, Isabel, Ada, Ned, Dee, Rena, Joel, Lora, Cecil, Aaron, Flora, Tina, Arden, Noel, and Ellen sinned.")
p palindrome("Depardieu, go razz a rogue I draped")
p palindrome("Desserts I stressed.")
p palindrome("Detartrated.")
p palindrome("Devo met a Mr., eh, DNA and her mate moved.")
p palindrome("Di as dad said.")
p palindrome("Did I draw Della too tall, Edward? I did?")
p palindrome("Dior droid.")
p palindrome("DNA-land.")
p palindrome("Do geese see god?")
p palindrome("Do good? I? No. Evil anon I deliver. I maim nine more hero-men in Saginaw, sanitary sword a-tuck, Carol, I. Lo! Rack, cut a drowsy rat in Aswan. I gas nine more hero-men in Miami. Reviled, I (Nona) live on. I do, O God.")
p palindrome("abracadabra!")
p palindrome("Mister, mister, on a see-saw with your sister.")
p palindrome("Almost every sentence is NOT a palindrome! How unfair!")

# 10.2 TODO count_sentences() ======================

def count_sentences(some_file)
  file_content = open(some_file).read()
  count = 0

  file_content.each_char do |c|
    count += 1 if c == "," || c == "?" || c == "!"
  end
  return count
end

# test code

p count_sentences("/users/dputnam/public_html/oliver.txt")

# 10.3 TODO count_paragraphs() =====================

def count_paragraphs(some_file)
  file_content = open(some_file).read()
  count = 0
  file_content_split = file_content.split('')

  file_content_split.each_index do |index|
    count += 1 if file_content_split[index] == "\n" && file_content_split[index + 1] == "\n"
  end
  return count
end

# test code

p count_paragraphs("r/users/dputnam/public_html/oliver.txt")

# 10.4 TODO anagram() ==============================

def anagram(words)
  words_hash = {}

  words_hash = words.each_with_object(Hash.new []) do |word, hash|
    hash[word.chars.sort] += [word]
  end

  words_array = words_hash.flatten
  final_hash = []

  words_array.each_index do |index|
    final_hash << words_array[index] if index.odd?
  end

  return final_hash
end

# test code

words = ['Cars', 'ofr','rof', 'for', 'potatoes', 'raCs', 'four','Scar', 'creams', 'scream']
p anagram(words)