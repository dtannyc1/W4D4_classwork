#-------------------------------------------------------------------------------
# Givens:
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# O(n^2)
def my_min_V1(arr)
    arr.each do |ele_1|
        smallest = true
        arr.each do |ele_2|
            smallest = false if ele_2 < ele_1
        end
        return ele_1 if smallest
    end
end


# O(n)
def my_min_V2(arr)
    smallest = arr[0]
    arr.each {|ele| smallest = ele if ele < smallest}
    return smallest
end

p "---- my_min ----"
p my_min_V1(list)
p "---"
p my_min_V2(list)

#-------------------------------------------------------------------------------
# Givens:
list_1 = [5, 3, -7]             # => 8
list_2 = [2, 3, -6, 7, -6, 7]   # => 8
list_3 = [-5, -1, -3]           # => -1

# O(2^n) - Exponential b/c of subsets
def largest_contiguous_subsum_V1(arr)
    curmax_sum = arr[0]
    (0...arr.length).each do |ii|
        (ii...arr.length).each do |jj|
            sub_array = arr[ii..jj]
            curmax_sum = sub_array.sum if sub_array.sum > curmax_sum
        end
    end
    curmax_sum
end

# O(n)
def largest_contiguous_subsum_V2(arr)
    curmax_sum = arr[0]
    cursum = 0
    (0...arr.length).each do |ii|
        cursum += arr[ii]
        cursum = arr[ii] > cursum ? arr[ii] : cursum
        curmax_sum = cursum if cursum > curmax_sum
    end
    curmax_sum
end


p "---- largest contiguous subsum ----"
p largest_contiguous_subsum_V1(list_1)
p largest_contiguous_subsum_V1(list_2)
p largest_contiguous_subsum_V1(list_3)
p "---"
p largest_contiguous_subsum_V2(list_1)
p largest_contiguous_subsum_V2(list_2)
p largest_contiguous_subsum_V2(list_3)
