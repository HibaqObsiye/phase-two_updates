class Todo
    def initialize(task) # task is a string
      @task = task
      @done = false
    end
  
    def task
      @task
    end
  
    def mark_done!
      @done = true
    end
  
    def done?
      if  @done == true
        true
      else
        false
      end
    end
    
    
end