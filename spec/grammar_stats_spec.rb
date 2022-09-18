require '/Users/hibaqobsiye/phase-2/hibaq_piper_pairing_1509/lib/grammar_stats.rb'

RSpec.describe GrammarStats do

    context "if given an empty string" do
        it "fails" do
            grammar_stats = GrammarStats.new
            expect { grammar_stats.check("") }.to raise_error "Give me a string"
        end
    end

    context "if given an empty argument" do
        it "fails" do
            grammar_stats = GrammarStats.new
            expect { grammar_stats.check(nil) }.to raise_error "Give me a string"
        end
    end

    context "if given an integer" do
        it "fails" do
            grammar_stats = GrammarStats.new
            expect{grammar_stats.check(2)}.to raise_error "Give me a string"
        end
    end

   it "returns false if given a grammatically incorrect one word string" do
    grammar_stats = GrammarStats.new
    result = grammar_stats.check("hello")
    expect(result).to eq false
   end
   
   it "returns false if given a string that doesn't start with a capital letter" do
        grammar_stats = GrammarStats.new
        result = grammar_stats.check("hello world.")
        expect(result).to eq false
   end

   it "returns true if text grammatically correct" do
        grammar_stats = GrammarStats.new
        result = grammar_stats.check("Hello.")
        expect(result).to eq true
   end
 

    describe '#percentage_good' do
        
        it " return the number of texts that satisfy the grammar check as an integer"  do
            grammarstats = GrammarStats.new
            grammarstats.check("I am here today!")
            grammarstats.check("I am not here!")
            grammarstats.check("I am here")
            expect(grammarstats.percentage_good).to eq 67
         end
    end

    # grammarstats = GrammarStats.new
    #     result = grammarstats.check("Abc!")
    #     result = grammarstats.check("Bbc!")
    #     expect(result).to eq ["Abc!","Bbc!"]

end