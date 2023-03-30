# for each ele, check if arr.include?(target-ele) - O(n^2)
# sort, then add largest + smallest - O(nlogn) + O(n^2) so O(n^2
    # if too large, decrease largest element
    # if too small, increase smallest element
    # if equal, return
# do we need to sort? just getting the min/max is O(n), remove and recurse

# O(n^2)
def bad_two_sum?(arr, target)
    (0...arr.length).each do |ii| # O(n)
        (ii+1...arr.length).each do |jj| # O(n)
            return true if arr[ii] + arr[jj] == target # O(1)
        end
    end
    false
end

# O(nlogn)
def okay_two_sum?(arr, target)
    sorted_arr = arr.sort # O(nlogn)

    small_index = 0
    large_index = arr.length - 1
    while small_index != large_index # O(n)
        case arr[small_index] + arr[large_index] <=> target
        when -1
            small_index += 1
        when 0
            return true
        when 1
            large_index -= 1
        end
    end
    false
end

# O(n)
def two_sum?(arr,target)
    hash = Hash.new(nil) # O(1)
    arr.each do |ele| # O(n)
        if hash[target - ele] # O(1)
            return true
        else
            hash[ele] = target - ele # O(1)
        end
    end
    false
end





#-------------------------------------------------------------------------------
# Given:
arr = [0, 1, 5, 7]

p "-- Bad Two Sum --"
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false
p "-- Okay Two Sum --"
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false
p "-- Linear Two Sum --"
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
p "----"
