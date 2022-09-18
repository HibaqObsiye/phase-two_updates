require_relative '../lib/diary_entry.rb'

RSpec.describe DiaryEntry do

     it "constructs " do
        entry = DiaryEntry.new("my title", "my_contents")
        expect(entry.title).to eq "my title"
        expect(entry.contents).to eq "my_contents"
    end

    describe "#count_words" do
        it "returns the number of words in the contents as an integer" do
            entry = DiaryEntry.new("tuesday","I ate a whole wild boar")
            entry.count_words
            expect(entry.count_words).to eq 6
        end

        it "returns zero when contents are empty" do
            entry = DiaryEntry.new("my_title","")
            expect(entry.count_words).to eq 0
        end
    end

    describe '#reading_time' do
        context "given wpm of a sensible number" do
            it "returns an integer representing an estimate of the reading time in minutes" do
                entry = DiaryEntry.new("wednesday","the internet stopped working")
                result = entry.reading_time(10)
                expect(result).to eq 1
            end
        end

        context "given wpm of 0" do
            it "fails" do
                entry = DiaryEntry.new("my_title", "one two three")
                expect{entry.reading_time(0)}.to raise_error "reading time must be above zero"
            end
        end
        
        it "returns a chunk of code that the user can read" do
            entry = DiaryEntry.new("my_title", "one two three four five six seven")
            entry.reading_chunk(2,3)
            expect(entry.reading_chunk(2,3)).to eq "one two three four five six"

        end
    
    
    end









    # describe '#reading_chunk' do
    #     context "with a text readable within the given minutes" do
    #         it " returns the full content" do
    #             entry = DiaryEntry.new("title","one two three")
    #             result = entry.reading_chunk(200, 1)
    #             expect(result).to eq "one two three"
    #         end
    #     end

    #     context "with a contents unreadable within the time" do
    #         it "returns a readable chunk" do
    #             entry = DiaryEntry.new("my_title","one two three")
    #             result = entry.reading_chunk(2,1)
    #             expect(result).to eq "one two"
    #         end
    #     end

    #         it "returns the next chunk,next time we are asked" do
    #             entry = DiaryEntry.new("my_title","one two three")
    #             entry.reading_chunk(2,1)
    #             result = entry.reading_chunk(2,1)
    #             expect(result).to eq "three"  
    #         end

    #         it "restarts after reading the whole contents" do
    #             entry = DiaryEntry.new("my_title","one two three")
    #             entry.reading_chunk(2,1)
    #             entry.reading_chunk(2,1)
    #             result = entry.reading_time(2,1)
    #             expect(result).to eq "one two" 
    #         end

        
    # end

end
