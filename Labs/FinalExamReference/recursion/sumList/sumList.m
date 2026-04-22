% Octave
function result = sum_list(lst)
    if isempty(lst)
        result = 0;
    else
        result = lst(1) + sum_list(lst(2:end));
    end
end