class Tracks

    def initialize
        @lists = []
    end

    def add(tracks)
        fail "already a track listed" if @lists.include?(tracks)
        @lists << tracks
    end



    def list
    @lists
    end
end
