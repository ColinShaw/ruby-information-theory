# Information Theory demo
# Copyright (c) 2016, Colin Shaw
# Distributed under the terms of the MIT License

require '../src/information_theory.rb'
require '../src/symbols.rb'
require '../src/randu.rb'

SYMBOLS = 10000

r             = RANDU.new 321
randu         = Array.new(SYMBOLS).map { r.random % 256 }
randu_probs   = Symbols.sym_to_prob_hash randu
randu_entropy = InformationTheory.entropy randu_probs

rand         = Array.new(SYMBOLS).map { Random::srand % 256 }
rand_probs   = Symbols.sym_to_prob_hash rand
rand_entropy = InformationTheory.entropy rand_probs

puts
puts 'RNG SYMBOL ENTROPY'
puts
puts 'RANDOM entropy:        ' + rand_entropy.round(3).to_s
puts 'RANDU entropy:         ' + randu_entropy.round(3).to_s
puts
