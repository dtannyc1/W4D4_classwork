require_relative 'my_stack'

class StackQueue
    def initialize
        @enqueue_stack = MyStack.new
        @dequeue_stack = MyStack.new
        @size = 0
    end

    def size
        @size
    end

    def empty?
        size == 0
    end

    def enqueue(ele)
        @enqueue_stack.push(ele)
    end

    def dequeue
        if @dequeue_stack.empty?
            repopulate_dequeue
            @dequeue_stack.pop
        else
            @dequeue_stack.pop
        end
    end

    def repopulate_dequeue
        tmp_stack = enqueue_stack.dup
        while !tmp_stack.empty?
            dequeue_stack.push(tmp_stack.pop)
        end
    end
end
