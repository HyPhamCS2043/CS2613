1;
#Author: Hy Pham
#3644179

testMatrix = [1 2 3 4 5];

#Function to calculate the sum of all numbers in the input list
function sumOut = calSum (lst)
    sumOut = 0;
    for i = lst
        sumOut += i;
    endfor
endfunction

calSum(testMatrix)

#Function to calculate the average of all numbers in the input list
function avgOut = calAvg(lst)
    total = calSum(lst);
    avgOut = total/length(lst);
endfunction

calAvg(testMatrix)

#Function to calculate the largest value of the input list
function maxOut = calMax(lst)
    maxOut = lst(1);
    for i = lst
        if i > maxOut
            maxOut = i;
        endif
    endfor
endfunction

calMax(testMatrix)

#Function to calculate the smallest value of the input list
function minOut = calMin(lst)
    minOut = lst(1);
    for i = lst
        if i < minOut
            minOut = i;
        endif
    endfor
endfunction

calMin(testMatrix)

#Function that recursively calculate the factorial value of the input number 
function numOut = calFactorial(num)
    if (num == 0 || num == 1)
        numOut = 1;
    else
        numOut = num * calFactorial(num - 1);
    endif
endfunction

disp("The value of calFactorial(5) is:"), disp(calFactorial(5));

#Function that calculate the power of input number to input exponent
function numOut = calPower(num, exponent)
    if (exponent == 0)
        numOut = 1;
    else
        numOut = num * calPower(num, exponent - 1);
    endif
endfunction

disp("The value of calPower(2, 3) is:"), disp(calPower(2, 3));

#Function that approximate exponential function for each
#value in input list
function lstOut = calExpo(lst)
    
endfunction