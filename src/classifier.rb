# Information Theory demo
# Copyright (c) 2016, Colin Shaw
# Distributed under the terms of the MIT License

require 'csv'
require '../src/symbols.rb'
require '../src/information_theory.rb'

module Classifier

    def self.load file, opts = { :col_sep => '|' }
        res   = []
        fdata = CSV.read(file,opts)
        head  = fdata[0].each { |h| h.strip! }
        data  = fdata[1..-1].transpose
        out   = data.last
        data.each_with_index do |row,i1|
            temp  = []
            row.each_with_index { |val,i2| temp << { row[i2].strip => out[i2] } }
            res << { head[i1] => temp }
        end
        res
    end

    def self.data_column_names data
        res = []
        data.each { |v| res << v.first[0] }
        res.pop
        res
    end

    def self.result_column_name data
        data.last.first[0]
    end

    def self.results_by_column_name data, col_name
        res = nil
        data.each_with_index { |row,idx| res = data[idx] if row.first[0] == col_name }
        res
    end 

    def self.unique_column_values column
        column.to_a[0][1].map { |c| c.to_a[0][1] }.uniq
    end

    def self.filter_column_by_value column, value
        column.to_a[0][1].reject { |c| value == c.to_a[0][1] }
    end

    def self.column_sum column
        column.values.reduce(0.0) { |sum, val| sum + val }
    end

    def self.data_column_information data, column, bias = 0.0
        res = {}
        col = results_by_column_name data, column  
        unq = unique_column_values col 
        tot = col.to_a[0][1].count
        unq.each do |v|
            filt   = filter_column_by_value col, v 
            frac   = filt.count.to_f / tot.to_f
            ent    = InformationTheory.entropy (Symbols.sym_to_prob_hash filt)
            res[v] = bias - ent * frac 
        end
        column_sum res  
    end

    def self.result_column_information data
        col_res = results_by_column_name data, (result_column_name data)
        InformationTheory.entropy Symbols.sym_to_prob_hash col_res.to_a[0][1]
    end

    def self.information_gain data
        entropy = result_column_information data
        (data_column_names data).map { |n| { n => (data_column_information data, n, entropy) } }
    end

end
