# CS2613: Lab 9
# Starter Code

disp("");
function retval = starterFunction()
	inputFile = fopen ("Input.txt", "r");
  	retval = {};
	len = length(retval);
	while (!feof (inputFile))
		line = fgetl(inputFile);
		[maxVal, index] = max(countLetters(line));
	    if(len == 0)
		    retval(1, 1) = char(index + 96);
		    retval(1, 2) = maxVal;
		else
			##create a new row with index number length of current cell array + 1
		    retval(len, 1) = char(index + 96);
			##we don't add 1 because the cell array length increases by 1 through the code above
		    retval(len, 2) = maxVal;
		end
		len = length(retval) + 1;
	end
	##remove second row because the loop add an empty row when it indexes length()+1
	retval(2, :) = [];
end

disp(starterFunction());

