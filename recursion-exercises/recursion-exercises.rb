def recursive_range(start, stop)
    return [] if stop < start
    return [start] if start + 1 == stop
    [start].concat(recursive_range(start + 1, stop))
end

def iterative_range(start, stop)
    return [] if stop < start
    array = []
    (start...stop).each {|num| array << num}
    array
end

puts "recursive range"
p recursive_range(1, 5)
p iterative_range(1, 5)
p recursive_range(-3, 5)
p iterative_range(-3, 5)
p recursive_range(6, 5)
p iterative_range(6, 5)
puts

def iter_sum(array)
    array.inject(&:+)
end

def rec_sum(array)
    return 0 if array.length == 0
    array[0] + rec_sum(array[1..-1])
end

puts "Sum Array"
p iter_sum([1,2,3])
p iter_sum([-2, 2, 5])
p rec_sum([1,2,3])
p rec_sum([-2, 2, 5])

def expo1(num, power)
    return 1 if power == 0
    return num if power == 1

    if power < 0
        return 1.0 / expo1(num, power.abs)
    end

    num * expo1(num, power-1)
end

puts "Expo"
p expo1(5, 0)
p expo1(5, 2)
p expo1(5, 3)
p expo1(-5, 2)
p expo1(-5, 3)
puts
puts "negative"
p expo1(5, -2)
