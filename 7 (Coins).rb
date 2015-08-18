def solution(a)
    n = a.length
    result = 0
    for i in 0 .. (n - 2)
        if (a[i] == a[i + 1]) then
            result = result + 1
        end
    end
    r = 0
    for i in 0 .. (n - 1)
        count = 0
        if (i > 0) then
            if (a[i - 1] != a[i]) then
                count = count + 1
            else
                count = count - 1
            end
        end
        if (i < n - 1) then
            if (a[i + 1] != a[i]) then
                count = count + 1
            else
                count = count - 1
            end
        end
        if (count > r) then
            r = count
        end
    end
    return result + r
end