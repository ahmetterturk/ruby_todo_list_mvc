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
        item unless item.nil?
    end

    def delete(content)
        item = @todo_list.find {|item| item.content == content}
        @todo_list.delete(item) unless item.nil?
    end 

    def display_todos
        @todo_list
    end
end
