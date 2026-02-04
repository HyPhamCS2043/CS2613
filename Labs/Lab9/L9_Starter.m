# CS2613: Lab 9
# Starter Code

disp("");
function retval = starterFunction()
	inputFile = fopen ("Input.txt", "r");
  	retval = {};
	while (!feof (inputFile))
		line = fgetl(inputFile);
		[maxVal, index] = max(countLetters(line));
	    if(length(retval) == 0)
		    retval(1, 1) = char(index + 96);
		    retval(1, 2) = maxVal;
		else
			retval(length(retval)+1, 1) = char(index + 96);
		    retval(length(retval), 2) = maxVal;
		end
	end
	retval(2, :) = [];
end

disp(starterFunction());

