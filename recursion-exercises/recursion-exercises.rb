def recursive_range(start, stop)
    return [] if stop < start
    return [start] if start + 1 == stop
    [start].concat(recursive_range(start + 1, stop))
end

def iterative_range(start, stop)

end