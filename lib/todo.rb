class Todo
    
    def initialize
        @todo_lists = []
    end


    def add(task)
        @todo_lists << task
    end

    def list
        @todo_lists
    end

    def complete(task)
        raise "not a given task" unless @todo_lists.include?(task)
        @todo_lists.delete(task)
    end

end