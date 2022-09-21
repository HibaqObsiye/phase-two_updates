require './lib/tracks.rb'

RSpec.describe Tracks do
 
    context "No tracks are added" do
        it "returns empty list" do
            tracks = Tracks.new
            tracks.list
            expect(tracks.list).to eq []
        end
    end
    context "Given a single track to add" do
        it "returns a list with track added to it" do
            tracks = Tracks.new
            tracks.add("natural woman")
            expect(tracks.list).to eq (["natural woman"])
        end
    end

    context "Given multiple tracks to add" do
        it "returns tracklist with the multiple tracks added to it" do
            tracks = Tracks.new
            tracks.add("natural woman")
            tracks.add("deja vu")
            expect(tracks.list).to eq (["natural woman","deja vu"])
        end
    end

    context "Given a track that is already listed to add to the tracklist " do
        it "raises an error" do
            tracks = Tracks.new
            tracks.add("natural woman")
            expect{tracks.add("natural woman")}.to raise_error "already a track listed"
        end
    
    end


end