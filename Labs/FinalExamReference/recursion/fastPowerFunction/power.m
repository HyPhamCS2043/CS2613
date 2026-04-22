% Octave - fast version O(log n)
function result = power_r(base, exp)
    if exp == 0
        result = 1;
    elseif mod(exp, 2) == 0
        half   = power_r(base, exp/2);
        result = half * half;
    else
        result = base * power_r(base, exp-1);
    end
end