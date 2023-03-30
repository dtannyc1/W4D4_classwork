require_relative 'min_max_stack'

class MinMaxStackQueue
    def initialize
        @enqueue_stack = MyStack.new
        @dequeue_stack = MyStack.new
    end

    def size
        @enqueue_stack.size + @dequeue_stack.size
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
        until enqueue.empty? do
            dequeue_stack.push(enqueue_stack.pop)
        end
    end
end
