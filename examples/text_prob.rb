# Information Theory demo
# Copyright (c) 2016, Colin Shaw
# Distributed under the terms of the MIT License

require 'pp'
require '../src/information_theory.rb'
require '../src/symbols.rb'

text_string =  File.read '../data/kafka_metamorphosis.txt'

characters   = Symbols.num_chars text_string 
char_probs   = Symbols.prob_of_chars text_string

puts
puts 'TEXT SYMBOL PROBABILITY'
puts
pp Hash[char_probs.sort_by { |_,v| v }.reverse].map { |v| { v[0] => v[1].round(5) } }
puts
