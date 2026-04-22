% Octave
function result = fib(n)
    if n <= 1
        result = n;
    else
        result = fib(n-1) + fib(n-2);
    end
end