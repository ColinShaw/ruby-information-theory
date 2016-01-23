# Information Theory demo
# Copyright (c) 2016, Colin Shaw
# Distributed under the terms of the MIT License

require 'pp'
require '../src/information_theory.rb'
require '../src/stats.rb'

p_x_y  = [[0.125, 0.375], [0.375, 0.125]]
p_x    = Stats.joint_to_marginal_x p_x_y
p_y    = Stats.joint_to_marginal_y p_x_y
mutual = InformationTheory.mutual_information p_x_y, p_x, p_y

puts
puts 'MUTUAL INFORMATION'
puts
puts 'Data:'
pp p_x_y
puts
puts 'Mutual information: ' + mutual.round(3).to_s
puts
