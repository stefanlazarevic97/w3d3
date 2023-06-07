require "byebug"

def rec_range(start, stop)
    return [] if stop < start
    return [start] if start + 1 == stop
    [start].concat(recursive_range(start + 1, stop))
end

def iter_range(start, stop)
    return [] if stop < start
    array = []
    (start...stop).each {|num| array << num}
    array
end

# puts "recursive range"
# p rec_range(1, 5)
# p iter_range(1, 5)
# p rec_range(-3, 5)
# p iter_range(-3, 5)
# p rec_range(6, 5)
# p iter_range(6, 5)
# puts

def iter_sum(array)
    array.inject(&:+)
end

def rec_sum(array)
    return 0 if array.length == 0
    array[0] + rec_sum(array[1..-1])
end

# puts "Sum Array"
# p iter_sum([1,2,3])
# p iter_sum([-2, 2, 5])
# p rec_sum([1,2,3])
# p rec_sum([-2, 2, 5])

def expo1(num, power)
    return 1 if power == 0
    return num if power == 1

    if power < 0
        return 1.0 / expo1(num, power.abs)
    end

    num * expo1(num, power - 1)
end

# puts "Expo"
# p expo1(5, 0)
# p expo1(5, 2)
# p expo1(5, 3)
# p expo1(-5, 2)
# p expo1(-5, 3)
# puts

# puts "negative"
# p expo1(5, -2)

def expo2(num, power, memo = {})
    return 1 if power == 0
    return memo[num] if memo.has_key?(num)

    if power.even?
        memo[num] = expo2(num, power / 2, memo) * expo2(num, power / 2, memo)
    else
        memo[num] = num * expo2(num, (power - 1) / 2, memo) * expo2(num, (power - 1) / 2, memo)
    end

    memo[num]
end

# puts "Expo"
# p expo2(5, 0)
# p expo2(5, 2)
# # p expo2(14, 97)
# p expo2(-5, 2)
# p expo2(-5, 3)
# puts

class Array
    def deep_dup
        copy = []

        self.each do |ele|
            debugger
            if ele.is_a?(Array)
                copy << ele.deep_dup
            else
                copy << ele
            end
        end

        copy
    end       
end

# a = [[1,2],[3],[4,[5,6]]]
# b = a.deep_dup
# p a
# p b

def iter_fib(n)
    return nil if n <= 0
    return 1 if n <= 2
    fib_array = [1, 1]

    until fib_array.length == n
        fib_array << fib_array[-1] + fib_array[-2]
    end

    fib_array[-1]
end

# p iter_fib(5)
# p iter_fib(0)
# p iter_fib(1)
# p iter_fib(2)
# p iter_fib(7)

def rec_fib(n, memo = {})
    return nil if n <= 0
    return 1 if n <= 2
    return memo[n] if memo.has_key?(n)

    memo[n] = rec_fib(n - 1, memo) + rec_fib(n - 2, memo)
    memo[n]
end

# p rec_fib(5)
# p rec_fib(0)
# p rec_fib(1)
# p rec_fib(2)
# p rec_fib(238)

