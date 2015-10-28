# Name: Chris Bastian - peacethrubeats@gmail.com
# Date: 2015-10-2 Friday
# File: lab3.rb
# Desc: Text analyzer

def file_process(file)

  stop_words = File.read('stop_words.txt').split("\n")

  lines = File.readlines(file)
  title = lines[0]
  speech = lines[1..-1]
  line_count = speech.size
  text = speech.join
  char_count = text.length
  char_count_nospaces = text.force_encoding('UTF-8').gsub(/\s+/, '').length
  word_count = text.scan(/\w+/).length
  sentence_count = text.split(/\.|\?|!/).length
  average_words_sentence = word_count / sentence_count
  paragraph_count = text.split(/\n\n/).length
  word_frequency_hash = {}
  word_frequency_top = []

  text.split().each do |word|
    unless stop_words.include?(word.downcase)
      if word_frequency_hash.has_key?(word.downcase)
        word_frequency_hash[word.downcase] += 1
      else
        word_frequency_hash[word.downcase] = 1
      end
    end
  end

  non_fluff_words = (word_frequency_hash.size.to_f / word_count.to_f * 100).to_i

  array_of_sentences = text.scan(/[^\.!?]+[\.!?]/).map(&:strip).sort_by { |sentence| sentence.length }
  ideal_sentences = array_of_sentences[array_of_sentences.length/3..array_of_sentences.length - array_of_sentences.length/3]

  word_frequency = word_frequency_hash.sort_by { |key, value| value}.reverse
  word_frequency.flatten.each_with_index { |word, index| word_frequency_top << word if index.even? }

  puts "#{title}"
  puts "#{line_count} lines"
  puts "#{char_count} characters"
  puts "#{char_count_nospaces} characters excluding spaces"
  puts "#{word_count} words"
  puts "#{sentence_count} sentences"
  puts "#{paragraph_count} paragraphs"
  puts "#{average_words_sentence} words per sentence (average)"
  puts "#{word_frequency_hash.size} non-fluff words"
  puts "roughly #{non_fluff_words} percent non-fluff words."
  puts "Top 10 non-fluff words: #{word_frequency_top.take(10)} top 10 non-fluff words."
  puts "Ideal sentences array: #{ideal_sentences.take(7) }"
  puts
  puts

end

Dir.glob('inaugural_addresses/*.txt').each do |file|
  file_process(file)
end