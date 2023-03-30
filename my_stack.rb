class MyStack
    def initialize
        @store = []
    end

    def push(ele)
        @store.push(ele)
    end

    def pop(ele)
        @store.pop(ele)
    end

    def peek
        @store[-1]
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end
end
