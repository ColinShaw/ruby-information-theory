# Information Theory demo
# Copyright (c) 2016, Colin Shaw
# Distributed under the terms of the MIT License

module WaveGenerator

    SAMPLES = 200
    SYMBOLS = 8

    def self.white 
        Array.new(SAMPLES,nil).map { |v| Random.rand(SYMBOLS) } 
    end

    def self.sawtooth
        i = -1
        Array.new(SAMPLES) { (i+=1) % SYMBOLS }
    end

end
