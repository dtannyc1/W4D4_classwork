require_relative 'my_stack'

class MinMaxStack < MyStack
    def initialize
        @min_stack = Stack.new
        @max_stack = Stack.new
        super
    end

    def push(ele)
        super
        @max_stack.push(ele) if popped_ele > max
        @min_stack.push(ele) if popped_ele < min
    end

    def pop
        popped_ele = super
        @max_stack.pop if popped_ele == max
        @min_stack.pop if popped_ele == min
    end

    def max
        @max_stack.peek
    end

    def min
        @min_stack.peek
    end
end
