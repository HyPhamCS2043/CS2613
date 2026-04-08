#Author: Hy Pham
#Student ID: 3644179

1;
function statistic = vectorStatistic (v)
    statistic = [];
    vectorMean = sum(v)/length(v);
    vectorVar = sum((v - vectorMean).^2)/length(v);
    vectorSD = sqrt(vectorVar);
    statistic(1) = vectorMean;
    statistic(2) = vectorVar;
    statistic(3) = vectorSD;
endfunction

values = [2, 4, 6, 8, 10];
vectorStatistic(values)