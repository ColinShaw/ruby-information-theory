# Information Theory demo
# Copyright (c) 2016, Colin Shaw
# Distributed under the terms of the MIT License

module Stats

    def self.joint_to_marginal_x p_x_y
        p_x_y.transpose.map { |r| r.reduce(0.0) { |sum,val| sum + val } }
    end

    def self.joint_to_marginal_y p_x_y
        p_x_y.map { |r| r.reduce(0.0) { |sum,val| sum + val } }    
    end

end
