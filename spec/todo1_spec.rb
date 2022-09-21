require 'todo1.rb'
require 'todo_list.rb'

RSpec.describe Todo do

   it "constructs" do
     todo = Todo.new("clean your room")
     expect(todo.task).to eq "clean your room"
   end




end