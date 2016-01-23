# Information Theory demo
# Copyright (c) 2016, Colin Shaw
# Distributed under the terms of the MIT License

require 'pp'
require '../src/wave_generator.rb'
require '../src/information_theory.rb'
require '../src/symbols.rb'


puts
puts 'WHITE AND SAWTOOTH WITH SYMBOL DISTRIBUTION'
puts


# White noise
white       = WaveGenerator.white
white_probs = Symbols.sym_to_prob_hash white
white_ent   = InformationTheory.entropy white_probs
 
puts 'White noise:'
pp white_probs.sort.map { |v| { v[0] => v[1].round(3) } }
puts '   Expected symbol entropy: ' + white_ent.round(3).to_s
puts


# Sawtooth 
saw       = WaveGenerator.sawtooth
saw_probs = Symbols.sym_to_prob_hash saw
saw_ent   = InformationTheory.entropy saw_probs

puts 'Sawtooth:'
pp saw_probs.sort.map { |v| { v[0] => v[1].round(3) } }
puts '   Expected symbol entropy: ' + saw_ent.round(3).to_s
puts

