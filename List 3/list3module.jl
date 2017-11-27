# Author: Krzysztof Nowak
__precompile__()
module L3
export mbisekcji, mstycznych, msiecznych

function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
    local c, w
    M = 100
    u = f(a)
    v = f(b)
    e = b - a
    if sign(u) == sign(v)
        return (0,0,0,1)
    end
    for k = 1:M
        e = e / 2.0
        c = a + e
        w = f(c)
        if abs(e) < delta || abs(w) < epsilon
            return(c, w, k, 0)
        end
        if sign(w) != sign(u)
            b = c
            v = w
        else
            a = c
            u = w
        end
    end
    return (c, w, M, 0)
end

function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    local x1
    v = f(x0)
    if abs(v) < epsilon
        return (x0, v, 0, 0)
    end
    for k = 1:maxit
        derivative = pf(x0)
        if abs(derivative) < epsilon
            return (x0, v, k, 2)
        end
        x1 = x0 - v / derivative
        v = f(x1)
        if abs(x1 - x0) < delta || abs(v) < epsilon
            return (x1, v, k, 0)
        end
        x0 = x1
    end
    return (x1, v, maxit, 1)
end

function msiecznych(f, x0::Float64, x1:: Float64, delta::Float64, epsilon::Float64, maxit::Int)
    fa = f(x0)
    fb = f(x1)
    for k = 1:maxit
        if abs(fa) > abs(fb)
            x0, x1 = x1, x0
            fa, fb = fb, fa
        end
        s = (x1 - x0) /  (fb - fa)
        x1 = x0
        fb = fa
        x0 = x0 - fa * s
        fa = f(x0)
        if abs(x1 - x0) < delta || abs(fa) < epsilon
            return (x0, fa, k, 0)
        end
    end
    return(x0,fa,maxit,1)
end

end  # module List3
