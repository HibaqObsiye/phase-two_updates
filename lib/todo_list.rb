class TodoList
    def initialize
        @todo_list = []
        @complete_tasks =[]
    end
  
    def add(todo) # todo is an instance of Todo
      # Returns nothing
      @todo_list << todo
    end
  
    def incomplete
      @todo_list
    end
  
    def complete
     @todo_list.each do |task|
        if task.done?
            @complete_tasks << task
            @todo_list.delete(task)
        end     
     end
     @complete_tasks 
    end
  
    def give_up!
      @todo_list.each do |task| 
        task.mark_done!
      end
    end
  end

  