class MyQueue
    def initialize
        @store = []
    end

    def enqueue(ele)
        @store << ele
    end

    def dequeue
        @store.shift
    end

    def peek
        @store[0]
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end
end
