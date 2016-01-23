# Information Theory demo
# Copyright (c) 2016, Colin Shaw
# Distributed under the terms of the MIT License

require 'pp'
require '../src/classifier.rb'

puts
puts 'DECISION TREE NODE EXAMPLE'
puts
pp Classifier.information_gain Classifier.load '../data/classifier.txt'
puts

