require './lib/diary_entry1.rb'
require './lib/diary.rb'

RSpec.describe DiaryEntry do

    it "constructs " do
        entry = DiaryEntry.new("my title", "my_contents")
        expect(entry.title).to eq "my title"
        expect(entry.contents).to eq "my_contents"
    end

    describe "#count_words" do
        it "zero if given empty content" do
            entry = DiaryEntry.new("tuesday","")
            entry.count_words
            expect(entry.count_words).to eq 0
        end

        it "returns 1 if given 1 word content" do
            entry = DiaryEntry.new("tuesday","one")
            entry.count_words
            expect(entry.count_words).to eq 1
        end

        it "returns the number of words in the contents as an integer" do
            entry = DiaryEntry.new("tuesday","I ate a whole wild boar")
            entry.count_words
            expect(entry.count_words).to eq 6
        end
    end

    describe "#reading_time" do
        it "fails if wpm is zero" do
            diary_entry = DiaryEntry.new("my_title","hello")
            expect{diary_entry.reading_time(0)}.to raise_error "reading time must be above zero"
        end
        it "zero if given empty content" do
            entry = DiaryEntry.new("tuesday","")
            expect(entry.reading_time(1)).to eq 0
        end

        it "returns 1 if given 1 word content" do
            entry = DiaryEntry.new("tuesday","one")
            expect(entry.reading_time(1)).to eq 1
        end

        it "returns the reading time when given content" do
            entry = DiaryEntry.new("tuesday","I ate a whole wild boar")
            expect(entry.reading_time(3)).to eq 2
        end
    end

    describe '#reading_chunk' do
        context "given text that can be read in the time given" do
            it "returns the full content" do
                entry = DiaryEntry.new("my_title", "one two three four")
                entry.reading_chunk(4,1)
                expect(entry.reading_chunk(4,1)).to eq "one two three four"
            end
        end
        context "with a contents unreadable within the time" do
            it "returns a readable chunk" do
                entry = DiaryEntry.new("my_title","one two three")
                result = entry.reading_chunk(2,1)
                expect(result).to eq "one two"
            end
        end
        
        it "returns the next chunk,next time we are asked" do
            entry = DiaryEntry.new("my_title","one two three")
            entry.reading_chunk(2,1)
            result = entry.reading_chunk(2,1)
            expect(result).to eq "three"  
        end
        
        it "restarts after reading the whole contents" do
            entry = DiaryEntry.new("my_title","one two three")
            entry.reading_chunk(2,1)
            entry.reading_chunk(2,1)
            result = entry.reading_chunk(2,1)
            expect(result).to eq "one two" 
        end

    end


end