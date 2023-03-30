require_relative 'min_max_stack'

class MinMaxStackQueue
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
        until @enqueue_stack.empty? do
            @dequeue_stack.push(@enqueue_stack.pop)
        end
    end

    def max
        enqueue_max = @enqueue_stack.max
        dequeue_max = @dequeue_stack.max
        return dequeue_max if enqueue_max.nil?
        return enqueue_max if dequeue_max.nil?

        enqueue_max > dequeue_max ? enqueue_max : dequeue_max
    end

    def min
        enqueue_min = @enqueue_stack.min
        dequeue_min = @dequeue_stack.min
        return dequeue_min if enqueue_min.nil?
        return enqueue_min if dequeue_min.nil?

        enqueue_min < dequeue_min ? enqueue_min : dequeue_min
    end
end
