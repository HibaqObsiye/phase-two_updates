class Todo
    def initialize(task) # task is a string
      @task = task
      @done = false
    end
  
    def task
      @task
    end
  
    def mark_done!
      # Marks the todo as done
      # Returns nothing
      @done = true
    end
  
    def done?
      # Returns true if the task is done
      # Otherwise, false
      if  @done == true
        true
      else
        false
      end
    end
    
    
end