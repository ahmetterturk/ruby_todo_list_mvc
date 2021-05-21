require_relative '../models/todo_item'
require_relative '../models/todo'
require_relative '../views/todo_view'

describe TodoItem do 
    it "should create a todo item" do 
        walk = "take a walk"
        todo = TodoItem.new(walk)
        expect(todo.content).to eq(walk)
    end
    it "should have an id" do 
        walk = "take a walk"
        todo = TodoItem.new(walk)
        expect(todo.id).to be_between(1, 100)
    end
end

describe Todo do 
    it "should add todo to list" do 
        content = "walk dog"
        name = "Ahmet's Todo"
        todo = Todo.new(name)
        expect {todo.add(content)}.to change {todo.length}.by(1)
    end
    it "should respond to name" do 
        name = "todo"
        expect(Todo.new(name)).to respond_to(:name)
    end
    it "should delete an item" do 
        content_1 = "walk dog"
        content_2 = "play in park"
        content_3 = "buy groceries"
        name = "Ahmet's Todo"
        todo = Todo.new(name)
        todo.add(content_1)
        todo.add(content_2)
        todo.add(content_3)
        expect {todo.delete(content_2)}.to change {todo.length}.by(-1)
    end
end
