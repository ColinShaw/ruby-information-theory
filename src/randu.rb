# Information Theory demo
# Copyright (c) 2016, Colin Shaw
# Distributed under the terms of the MIT License

class RANDU

    def initialize seed
        @r = seed
    end

    def random
        @r = (65539 * @r) & 0x7fff_ffff
    end

end
