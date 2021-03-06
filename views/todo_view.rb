require_relative '../models/todo'
require 'tty-table'
require 'tty-prompt'

class TodoView 
    def initialize(todo)
        @todo = todo
    end

    def title
        puts "#{@todo.name}"
        puts "--------------"
    end

    def create
        puts "Add a new item to the Todo List"
        item = gets.chomp.strip 

        @todo.add(item)
    end 

    def update
        if @todo.length == 0 
            puts "Nothing to update, list empty!"
        else
            puts "select a todo to be updated"
            list_of_todos = @todo.display_todos.map {|todo| todo.to_s}
            prompt = TTY::Prompt.new
            input = prompt.select("Select a todo to be updated", list_of_todos)
            puts "enter new todo to be replaced"
            new_content = gets.chomp.strip
            @todo.update(input, new_content)
        end
    end

    def delete
        if @todo.length == 0 
            puts "Nothing to delete, list empty!"
        else
            puts "Select a todo to be deleted"
            list_of_todos = @todo.display_todos.map {|todo| todo.to_s}
            prompt = TTY::Prompt.new
            content = prompt.select("Select a todo to be updated", list_of_todos)
            @todo.delete(content)
        end
    end 

    def list
        if @todo.length == 0 
            puts "No items in todo list"
        else 
            rows = @todo.display_todos.map do |todo|
                if not todo.nil?
                    [todo.content]
                end
            end
            table = TTY::Table.new([@todo.name], rows)
            puts table.render(:unicode)
        end
    end
end