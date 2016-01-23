# Information Theory demo
# Copyright (c) 2016, Colin Shaw
# Distributed under the terms of the MIT License

module Symbols

    def self.sym_to_prob_hash syms 
        prob = Hash.new(0.0)
        incr = 1.0 / syms.length.to_f
        syms.each { |s| prob[s] += incr }
        prob
    end

    def self.filter_hash_keys p_hash, regex
        p_hash.select { |k,_| regex.match k }
    end

    def self.prob_of_chars str
        sym_to_prob_hash filter_hash_keys str.downcase.split(''), /[a-z]/
    end 

    def self.num_chars str
        (filter_hash_keys str.downcase.split(''), /[a-z]/).length
    end
    
    def self.prob_of_all str 
        sym_to_prob_hash str.split('')
    end

    def self.num_all str 
        str.length
    end

    def self.prob_of_words str
        str = str.downcase.gsub /[^a-z\s]/i, ''
        sym_to_prob_hash filter_hash_keys str.split(' '), /[a-z]+/
    end
    
    def self.num_words str
        str = str.downcase.gsub /[^a-z\s]/i, ''
        (filter_hash_keys str.split(' '), /[a-z]+/).length
    end
        
end
