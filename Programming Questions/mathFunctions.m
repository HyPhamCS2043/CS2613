1;
#Author: Hy Pham
#3644179

testMatrix = [1.0 2.0 3.0 4.0 5.0];

#Function to calculate the sum of all numbers in the input list
function sumOut = calSum (lst)
    sumOut = 0;
    for i = lst
        sumOut += i;
    endfor
endfunction

calSum(testMatrix);

#Function to calculate the average of all numbers in the input list
function avgOut = calAvg(lst)
    total = calSum(lst);
    avgOut = total/length(lst);
endfunction

calAvg(testMatrix);

#Function to calculate the largest value of the input list
function maxOut = calMax(lst)
    maxOut = lst(1);
    for i = lst
        if i > maxOut
            maxOut = i;
        endif
    endfor
endfunction

calMax(testMatrix);

#Function to calculate the smallest value of the input list
function minOut = calMin(lst)
    minOut = lst(1);
    for i = lst
        if i < minOut
            minOut = i;
        endif
    endfor
endfunction

calMin(testMatrix);

#Function that recursively calculate the factorial value of the input number 
function numOut = calFactorial(num)
    if (num == 0 || num == 1)
        numOut = 1;
    else
        numOut = num * calFactorial(num - 1);
    endif
endfunction

#disp("The value of calFactorial(5) is:"), disp(calFactorial(5));

#Function that calculate the power of input number to input exponent
function numOut = calPower(num, exponent)
    if (exponent == 0)
        numOut = 1;
    else
        numOut = num * calPower(num, exponent - 1);
    endif
endfunction

#disp("The value of calPower(2, 3) is:"), disp(calPower(2, 3));

#Function that approximate exponential function for each
#value in input list
function listOut = calExpo(lst)
    listOut = [];
    for i = lst
        curCalResult = 0;
        for k = [0:51]
            curCalResult += calPower(i, k)/calFactorial(k);
        endfor
        listOut = [listOut, curCalResult];
    endfor
endfunction

output_precision (7);
calExpo(testMatrix);

#Function that approximate the Poisson distribution for each
#value in input list
function listOut = calPoisson(lst)
    listOut = [];
    for i = lst
        curCalResult = 0;
        for k = [0:51]
            curCalResult += k * (calPower(i, k)/calFactorial(k));
        endfor
        listOut = [listOut, curCalResult];
    endfor
endfunction

calPoisson(testMatrix);

#Function that approximate the Sin value for each
#value in input list
function listOut = calSin(lst)
    listOut = [];
    for i = lst
        curCalResult = 0;
        for k = [0:51]
            key = 2 * k + 1;
            curCalResult += (calPower(-1, k) * (calPower(i, key))/calFactorial(key));
        endfor
        listOut = [listOut, curCalResult];
    endfor
endfunction

output_precision(5);
calSin(testMatrix);

#Function that approximate cosine value for each
#value in input list
function listOut = calCos(lst)
    listOut = [];
    for i = lst
        curCalResult = 0;
        for k = [0:51]
            key = 2 * k;
            curCalResult += (calPower(-1, k) * (calPower(i, key))/calFactorial(key));
        endfor
        listOut = [listOut, curCalResult];
    endfor
endfunction

calCos(testMatrix);

function readInputFile(fileIn, fileOut)
    line = fgetl(fileIn);
    toWrite = "";
    while(line != "END")
        command = line;
        numOfVal = str2num(fgetl(fileIn));
        inputList = [];

        while numOfVal > 0
            val = str2num(fgetl(fileIn));
            inputList = [inputList, val];
            numOfVal -= 1;
        endwhile

        command = strtrim(command);

        if (command == "SUM")
            toWrite = cstrcat(toWrite, num2str(calSum(inputList)));
        elseif (command == "AVG")
            toWrite = cstrcat(toWrite, num2str(calAvg(inputList)));
        elseif (command == "MAX")
            toWrite = cstrcat(toWrite, num2str(calMax(inputList)));
        elseif (command == "MIN")
            toWrite = cstrcat(toWrite, num2str(calMin(inputList)));
        elseif (command == "FXP")
            toWrite = cstrcat(toWrite, num2str(calExpo(inputList)));
        elseif (command == "FPO")
            toWrite = cstrcat(toWrite, num2str(calPoisson(inputList)));
        elseif (command == "FSN")
            toWrite = cstrcat(toWrite, num2str(calSin(inputList)));
        elseif (command == "FCS")
            toWrite = cstrcat(toWrite, num2str(calCos(inputList)));
        endif

        toWrite = cstrcat(toWrite, "\n");
        line = fgetl(fileIn);
    endwhile
    toWrite = strtrim(toWrite);
    fputs(fileOut, toWrite);
endfunction

f1 = fopen("SampleInputFiles1/DataInput.txt","r");
out1 = fopen("PQ2_Octave_Outputs/Q1Output.txt", "w");
readInputFile(f1, out1);
fclose("SampleInputFiles1/DataInput.txt");
fclose("PQ2_Octave_Outputs/Q1Output.txt");

f2 = fopen("SampleInputFiles1/DataInput2.txt","r");
out2 = fopen("PQ2_Octave_Outputs/Q2Output.txt", "w");
readInputFile(f2, out2);
fclose("SampleInputFiles1/DataInput2.txt");
fclose("PQ2_Octave_Outputs/Q2Output.txt");

