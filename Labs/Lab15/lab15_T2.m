disp("");

f1 = @(x) (x^2)/3 - 5;
f2 = @(x) log10(x + 1);   
compareTo = @(x, y) x <= y;

testList = [1:10];

compareListPositions(f1, f2, compareTo, testList);