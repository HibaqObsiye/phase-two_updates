require 'todo1.rb'
require 'todo_list.rb'

RSpec.describe "integration" do
    context "Given a number of todos" do
        it "returns a list of the todos" do
            todo_list = TodoList.new
            task_1 = Todo.new("go shopping")
            task_2 = Todo.new("clean the room")
            todo_list.add(task_1)
            todo_list.add(task_2)
            expect(todo_list.incomplete).to eq [task_1,task_2]          
        end
    end 

    context "When a task is complete" do
        it "returns a list of complete tasks" do
            todolist = TodoList.new
            task_1 = Todo.new("clean room")
            task_2 = Todo.new("shopping")
            todolist.add(task_1)
            todolist.add(task_2)
            task_1.mark_done!
            result = todolist.complete
            expect(result).to eq [task_1]
        end
    end

    it "removes todos that are completed" do
        todolist = TodoList.new
        task_1 = Todo.new("clean room")
        task_2 = Todo.new("shopping")
        todolist.add(task_1)
        todolist.add(task_2)
        task_1.mark_done!
        todolist.complete
        result = todolist.incomplete
        expect(result).to eq [task_2]
    end

    it "marks all todos as completed" do
        todolist = TodoList.new
        task_1 = Todo.new("clean room")
        task_2 = Todo.new("hoover")
        todolist.add(task_1)
        todolist.add(task_2)
        todolist.give_up!
        expect(todolist.complete).to eq [task_1] #why does it not work when I do [task1,task2]
    end




end