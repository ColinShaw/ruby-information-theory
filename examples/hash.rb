# Information Theory demo
# Copyright (c) 2016, Colin Shaw
# Distributed under the terms of the MIT License

require 'digest'
require '../src/information_theory.rb'
require '../src/symbols.rb'

SYMBOLS = 10000

md5_hash  = ''
(SYMBOLS/32+1).times { md5_hash = md5_hash + (Digest::MD5.hexdigest Random::rand.to_s) }
md5_syms  = md5_hash[0...SYMBOLS].split('')
md5_probs = Symbols.sym_to_prob_hash md5_syms
md5_ent   = InformationTheory.entropy md5_probs

sha256_hash  = ''
(SYMBOLS/64+1).times { sha256_hash = sha256_hash + (Digest::SHA256.hexdigest Random::rand.to_s) }
sha256_syms  = sha256_hash[0...SYMBOLS].split('')
sha256_probs = Symbols.sym_to_prob_hash sha256_syms
sha256_ent   = InformationTheory.entropy sha256_probs

puts
puts 'HASH SYMBOL ENTROPY'
puts
puts 'Expected symbol entropy:'
puts '   MD5:    ' + md5_ent.round(5).to_s
puts '   SHA256: ' + sha256_ent.round(5).to_s
puts

