require_relative '../models/todo'
require_relative '../views/todo_view'
require 'tty-prompt'

class TodoController 
    def initialize(todo_model, todo_view)
        @todo_model = todo_model
        @todo_view = todo_view
    end

    def run
        @todo_view.title

        loop do 
            prompt = TTY::Prompt.new
            input = prompt.select("Select an option", %w(Add List Update Delete Exit), symbols: { marker: "\u{1F58B}" })
            if input == 'Add'
                @todo_view.create
            elsif input == 'List'
                @todo_view.list
            elsif input == 'Delete'
                @todo_view.delete
            elsif input == 'Update'
                @todo_view.update
            elsif input == 'Exit'
                puts "thank you come again"
                break
            end
        end
    end
end