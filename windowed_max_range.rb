require_relative 'MinMaxStackQueue'

# O(n^2)
def windowed_max_range(array, window_size)
    current_max_range = nil
    (0..array.length-window_size).each do |ii|     # O(n)
        sub_arr = array[ii...ii+window_size]        # O(n)
        curr_diff = sub_arr.max - sub_arr.min       # O(n)
        current_max_range = curr_diff if current_max_range.nil? # O(1)
        current_max_range = curr_diff if curr_diff > current_max_range # O(1)
    end
    current_max_range
end

#-------------------------------------------------------------------------------
# Given:
p "-- Naive Solution --"
p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

#-------------------------------------------------------------------------------

def windowed_max_range_V2(array, window_size)
    max_range = nil
    current_window = MinMaxStackQueue.new
    array.each do |ele|
        if current_window.size == window_size
            current_window.enqueue(ele)
            current_window.dequeue
            current_range = current_window.max - current_window.min
            max_range = current_range if max_range.nil?
            max_range = current_range if max_range < current_range
        else
            current_window.enqueue(ele)
        end
    end
    max_range
end

#-------------------------------------------------------------------------------
# Given:
p "-- With MinMaxStackQueue Data Structure --"
p windowed_max_range_V2([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range_V2([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range_V2([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range_V2([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
