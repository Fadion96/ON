using blocksys

function test16(pivot::Bool)
    timer = 0.0
    for i = 1 : 100
        mat = readMatrix("C:\\Users\\Krzysztof\\Desktop\\ON\\List 5\\A16.txt")
        n = mat[1]
        l = mat[2]
        A = mat[3]
        b = readVector("C:\\Users\\Krzysztof\\Desktop\\ON\\List 5\\b16.txt")
        x = @timed(gauss(A,b,n,l,pivot))
        timer = timer + x[2]
    end
    timer = timer / 100.0
    return timer
end

function test16normal()
    timer = 0.0
    for i = 1 : 100
        mat = readMatrix("C:\\Users\\Krzysztof\\Desktop\\ON\\List 5\\A16.txt")
        n = mat[1]
        A = mat[3]
        b = readVector("C:\\Users\\Krzysztof\\Desktop\\ON\\List 5\\b16.txt")
        x = @timed(normalGauss(A,b,n))
        timer = timer + x[2]
    end
    timer = timer / 100.0
    return timer
end


function test10000(pivot::Bool)
    timer = 0.0
    for i = 1 : 100
        mat = readMatrix("C:\\Users\\Krzysztof\\Desktop\\ON\\List 5\\A10000.txt")
        n = mat[1]
        l = mat[2]
        A = mat[3]
        b = readVector("C:\\Users\\Krzysztof\\Desktop\\ON\\List 5\\b10000.txt")
        x = @timed(gauss(A,b,n,l,pivot))
        timer = timer + x[2]
    end
    timer = timer / 100.0
    return timer
end

function test10000normal()
    timer = 0.0
    mat = readMatrix("C:\\Users\\Krzysztof\\Desktop\\ON\\List 5\\A10000.txt")
    n = mat[1]
    A = mat[3]
    b = readVector("C:\\Users\\Krzysztof\\Desktop\\ON\\List 5\\b10000.txt")
    x = @timed(normalGauss(A,b,n))
    timer = timer + x[2]
    return timer
end

function test50000(pivot::Bool)
    timer = 0.0
    for i = 1 : 10
        mat = readMatrix("C:\\Users\\Krzysztof\\Desktop\\ON\\List 5\\A50000.txt")
        n = mat[1]
        l = mat[2]
        A = mat[3]
        b = readVector("C:\\Users\\Krzysztof\\Desktop\\ON\\List 5\\b50000.txt")
        x = @timed(gauss(A,b,n,l,pivot))
        timer = timer + x[2]
    end
    timer = timer / 10.0
    return timer
end

function test50000normal()
    timer = 0.0
    for i = 1 : 2
        mat = readMatrix("C:\\Users\\Krzysztof\\Desktop\\ON\\List 5\\A.txt")
        n = mat[1]
        A = mat[3]
        b = readVector("C:\\Users\\Krzysztof\\Desktop\\ON\\List 5\\b2.txt")
        x = @timed(normalGauss(A,b,n))
        timer = timer + x[2]
    end
    timer = timer / 2.0
    return timer
end

mat = readMatrix("C:\\Users\\Krzysztof\\Desktop\\ON\\List 5\\A50000.txt")
n = mat[1]
l = mat[2]
A = mat[3]
b = readVector("C:\\Users\\Krzysztof\\Desktop\\ON\\List 5\\b50000.txt")
x = @timed(gauss(A,b,n,l,false))
vecc = x[1]
println(n, " true ", norm(vecc - ones(n, 1)) / norm(ones(n, 1)))
mat2 = readMatrix("C:\\Users\\Krzysztof\\Desktop\\ON\\List 5\\A50000.txt")
n2 = mat2[1]
l2 = mat2[2]
A2 = mat2[3]
b2 = calculateB(A2,ones(n2),n2,l2)
x2 = @timed(gauss(A2,b2,n2,l2,true))
vecc2 = x2[1]
println(n2, " true ", norm(vecc2 - ones(n2)) / norm(ones(n2)))

# println(test16(false))
# println(test16(true))
# println(test16normal())
#
# println(test10000(false))
# println(test10000(true))
# println(test10000normal())
#
# println(test50000(false))
# println(test50000(true))
# #println(test50000normal())
