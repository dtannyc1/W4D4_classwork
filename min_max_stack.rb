require_relative 'my_stack'

class MinMaxStack < MyStack
    def initialize
        @min_stack = MyStack.new
        @max_stack = MyStack.new
        super
    end

    def push(ele)
        super
        if !max.nil?
            @max_stack.push(ele) if ele > max
        else
            @max_stack.push(ele)
        end
        if !min.nil?
            @min_stack.push(ele) if ele < min
        else
            @min_stack.push(ele)
        end
    end

    def pop
        popped_ele = super
        @max_stack.pop if popped_ele == max
        @min_stack.pop if popped_ele == min
        popped_ele
    end

    def max
        @max_stack.peek
    end

    def min
        @min_stack.peek
    end
end
