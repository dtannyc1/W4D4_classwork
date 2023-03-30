require_relative 'my_stack'

class StackQueue
    def initialize
        @enqueue_stack = MinMaxStack.new
        @dequeue_stack = MinMaxStack.new
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

    def max
        @enqueue_stack.max > @dequeue_stack.max ? @enqueue_stack.max : @dequeue_stack.max
    end

    def min
        @enqueue_stack.min < @dequeue_stack.min ? @enqueue_stack.min : @dequeue_stack.min
    end
end
