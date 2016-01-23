# Information Theory demo
# Copyright (c) 2016, Colin Shaw
# Distributed under the terms of the MIT License

module InformationTheory

    def self.entropy p_x 
        p_x = p_x.values if p_x.class == Hash
        p_x.reduce(0.0) { |sum, val| sum + val * (Math::log val) } / (Math::log 0.5)
    end

    def self.joint_entropy p_x_y
        entropy p_x_y.flatten
    end

    def self.conditional_entropy p_x_y, p_x 
        (joint_entropy p_x_y) - (entropy p_x)
    end

    def self.mutual_information p_x_y, p_x, p_y
        (entropy p_x) + (entropy p_y) - (joint_entropy p_x_y)
    end

end
