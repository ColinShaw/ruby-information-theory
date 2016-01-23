# Information Theory demo
# Copyright (c) 2016, Colin Shaw
# Distributed under the terms of the MIT License

require '../src/information_theory.rb'
require '../src/symbols.rb'

text_string =  File.read '../data/kafka_metamorphosis.txt'
gzip_string = (File.read '../data/kafka_metamorphosis.gz').force_encoding 'ISO-8859-1'


characters   = Symbols.num_chars text_string 
char_probs   = Symbols.prob_of_chars text_string
char_entropy = InformationTheory.entropy char_probs

puts
puts 'TEXT SYMBOL ENTROPY'
puts
puts 'Characters:'
puts '   Expected character entropy:   ' + char_entropy.round(3).to_s
puts '   Number of characters:         ' + characters.to_s
puts '   Total character entropy:      ' + (char_entropy * characters).round(1).to_s 
puts

words        = Symbols.num_words text_string
word_probs   = Symbols.prob_of_words text_string
word_entropy = InformationTheory.entropy word_probs

puts 'Words:'
puts '   Expected word entropy:        ' + word_entropy.round(3).to_s
puts '   Number of words:              ' + words.to_s
puts '   Total word entropy:           ' + (word_entropy * words).round(1).to_s
puts

gzip         = Symbols.num_all gzip_string
gzip_probs   = Symbols.prob_of_all gzip_string
gzip_entropy = InformationTheory.entropy gzip_probs

puts 'Gzip:'
puts '   Expected gzip symbol entropy: ' + gzip_entropy.round(3).to_s
puts '   Number of gzip symbols:       ' + gzip.to_s
puts '   Total gzip symbol entropy:    ' + (gzip_entropy * gzip).round(1).to_s
puts
