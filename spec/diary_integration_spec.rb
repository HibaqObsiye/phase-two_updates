require './lib/diary.rb'
require './lib/diary_entry1.rb'


RSpec.describe "Diary integration" do

    context "Given diary entries" do
        it "returns a list of the entries" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my_title","my_contents")  
            diary_entry_2 = DiaryEntry.new("second_title","second_contents")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.all).to eq [diary_entry_1,diary_entry_2]          
        end
    end

    it "returns number of words in all diary entries " do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("my_title","my_contents")  
        diary_entry_2 = DiaryEntry.new("second_title","second_contents")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        expect(diary.count_words).to eq 2
    end

    describe "reading time behaviour" do
        it "calculates the reading time for all entries where it fits exactly" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my_title","my content ")  
            diary_entry_2 = DiaryEntry.new("second_title","second contents 2")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.reading_time(2)).to eq 3
        end

        it "fails when wpm is 0" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my_title","my content ")
            diary.add(diary_entry_1)
            expect{diary.reading_time(0)}.to raise_error("reading time must be above zero")
        end

        it "calculates the reading time for all entries where it doesn't fits exactly" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my_title","my content ")  
            diary_entry_2 = DiaryEntry.new("second_title","second contents 2")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.reading_time(2)).to eq 3
        end
    end

    describe '#reading_chunk' do
        it "returns best entry reading time " do
            diary = Diary.new
            diary_entry1 = DiaryEntry.new("my_title1", "A test")
            diary.add(diary_entry1)
            expect(diary.find_best_entry_for_reading_time(2, 1)).to eq diary_entry1
        end
    end





end