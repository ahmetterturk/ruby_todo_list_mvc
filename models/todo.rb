require_relative './todo_item'

class Todo 
    attr_reader :name
    def initialize(name)
        @name = name
        @todo_list = []
    end

    def length
        @todo_list.length
    end

    def add(content)
        todo_item = TodoItem.new(content)
        @todo_list << todo_item
    end

    def update(content, new_content)
        item = @todo_list.find {|item| item.content == content}
        item.content = new_content
        return item unless item.nil?
    end

    def delete(content)
        item = @todo_list.find {|item| item.content == content}
        @todo_list.delete(item) unless item.nil?
    end 

    # def display_todos
    #     @todo_list.each do |todo|
    #         puts todo
    #     end
    # end

    def display_todos
        @todo_list
    end


end

# walk = "take a walk"
# sleep = "sleep for an hour"
# hw = "finish the assignment"
# eat = "eat lunch"

# todo = Todo.new("Ahmet's Todo")
# p todo.name
# puts '------------'
# todo.add(walk)
# todo.add(sleep)
# todo.add(hw)
# todo.add(eat)
# todo.display_todos

# puts
# todo.delete(hw)
# todo.display_todos

# puts
# todo.delete(sleep)
# todo.display_todos

# puts
# todo.update(walk, "Fuck walking! Lets go for a run!")
# todo.display_todos
