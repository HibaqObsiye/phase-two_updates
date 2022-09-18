require './lib/todo.rb'

RSpec.describe Todo do
    
    context "when given no tasks" do
        it "returns empty array" do
            todo = Todo.new
            todo.list
            expect(todo.list).to eq []
        end
    end

    context "when given a single task" do
        it "returns task in a list " do
            todo = Todo.new
            todo.add("go to shop")
            expect(todo.list).to eq ["go to shop"]
        end
    end

    context "when given mulltiple tasks" do
        it "returns tasks in a list " do
            todo = Todo.new
            todo.add("go to shop")
            todo.add("go walk the dog")
            expect(todo.list).to eq ["go to shop","go walk the dog"]
        end
    end

    context "when a task is completed" do
        it "removes task from the list" do
            todo = Todo.new
            todo.add("go to the shop")
            todo.add("go walk the dog")
            todo.complete("go to the shop")
            expect(todo.list).to eq (["go walk the dog"])
        end
    end

    context "when trying to complete task not listed" do
        it "raises an error" do
            todo = Todo.new
            todo.add("go to the shop")
            expect{todo.complete("go clean the kitchen")}.to raise_error "not a given task"
        end
    end




end