#-------------------------------------------------------------------------------
# O(n!) - permutations
def first_anagram?(str_1, str_2)
    # get all anagrams of str_1
    all_anagrams = get_anagrams(str_1) # O(n!)
    all_anagrams.include?(str_2) # O(n)
end

def get_anagrams(str) # just a helper function
    return [str] if str.length == 1
    all_anagrams = []
    char = str[0]
    remaining_permutations = get_anagrams(str[1..-1])
    remaining_permutations.each do |sub_str|
        (0...sub_str.length).each do |ii|
            all_anagrams << sub_str[0...ii] + char + sub_str[ii..-1]
        end
    end
    all_anagrams
end

#-------------------------------------------------------------------------------
# O(n^2)
def second_anagram?(str_1, str_2)
    chars_2 = str_2.chars
    str_1.each_char do |char| # O(n)
        removal_index = chars_2.index(char) # O(n)
        return false if removal_index.nil?
        chars_2 = chars_2[0...removal_index] + chars_2[removal_index+1..-1] # O(n) - is there a constant time way to do this?
    end
    chars_2.empty?
end

#-------------------------------------------------------------------------------
# O(nlogn) at best b/c we're sorting
def third_anagram?(str_1, str_2) # hard to read
    sorted_str_1 = str_1.chars.sort!.join # O(n) + O(nlogn) + O(n)
    sorted_str_2 = str_2.chars.sort!.join # O(n) + O(nlogn) + O(n)
    sorted_str_1 == sorted_str_2
end

#-------------------------------------------------------------------------------
# O(n)
def fourth_anagram?(str_1, str_2)
    hash_1 = Hash.new(0)
    hash_2 = Hash.new(0)
    str_1.each_char {|char| hash_1[char] += 1}
    str_2.each_char {|char| hash_2[char] += 1}
    hash_1 == hash_2
end

#-------------------------------------------------------------------------------
# O(n), still have to iterate through all characters
def bonus_anagram?(str_1, str_2)
    hash = Hash.new(0)
    str_1.each_char {|char| hash[char] += 1}
    str_2.each_char do |char|
        hash[char] -= 1
        return false if hash[char] < 0
    end
    hash.values.sum == 0
end


#-------------------------------------------------------------------------------
# Testing
p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true
p "-----"
p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true
p "-----"
p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true
p "-----"
p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
p "-----"
p bonus_anagram?("gizmo", "sally")    #=> false
p bonus_anagram?("elvis", "lives")    #=> true
