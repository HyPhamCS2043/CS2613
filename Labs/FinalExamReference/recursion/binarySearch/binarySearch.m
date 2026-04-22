% Octave
function result = binary_search(lst, target, lo, hi)
    if lo > hi
        result = -1;
    else
        mid = floor((lo + hi) / 2);
        if lst(mid) == target
            result = mid;
        elseif lst(mid) < target
            result = binary_search(lst, target, mid+1, hi);
        else
            result = binary_search(lst, target, lo, mid-1);
        end
    end
end