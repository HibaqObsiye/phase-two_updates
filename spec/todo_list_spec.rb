require 'todo_list.rb'
require 'todo1.rb'

RSpec.describe do

    describe "#add" do

        context "given todos" do
            it "returns a list of todos" do
                todo_list = TodoList.new
                expect(todo_list.add("go clean")).to eq ["go clean"]
            end
        end

    end





end