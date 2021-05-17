require_relative './models/todo'
require_relative './views/todo_view'
require_relative './controllers/todo_controller'

todo_model = Todo.new("Ahmet's Todo List")
todo_view = TodoView.new(todo_model)
todo_controller = TodoController.new(todo_model, todo_view)

todo_controller.run