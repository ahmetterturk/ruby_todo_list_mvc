class TodoItem
    attr_accessor :content, :id 
    def initialize(content)
        @content = content
        @id = rand(1..100)
    end

    def to_s 
        "#{@content}"
    end
end
