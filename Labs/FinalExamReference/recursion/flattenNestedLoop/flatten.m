% Octave - uses cell arrays
function result = flatten(lst)
    if isempty(lst)
        result = {};
    elseif iscell(lst{1})
        result = [flatten(lst{1}), flatten(lst(2:end))];
    else
        result = [lst(1), flatten(lst(2:end))];
    end
end