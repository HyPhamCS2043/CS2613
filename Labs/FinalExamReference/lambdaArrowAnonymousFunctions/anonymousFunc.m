% ── OCTAVE ──────────────────────────────────────────────────────────

% Basic anonymous function
square = @(x) x .^ 2;
disp(square(5))                         % 25

% Multiple parameters
add = @(x, y) x + y;
disp(add(3, 4))                         % 7

% Used inline with arrayfun (equivalent of map/filter)
nums    = [1, 2, 3, 4, 5];
doubled = arrayfun(@(x) x * 2,         nums);
evens   = nums(arrayfun(@(x) mod(x,2) == 0, nums));
disp(doubled)                           % [2 4 6 8 10]
disp(evens)                             % [2 4]

% Returning an anonymous function from a function
function f = multiplier(n)
    f = @(x) x * n;
end

triple = multiplier(3);
disp(triple(7))                         % 21