# CS2613: Lab 9
# Starter Code

disp("");
function retval = starterFunction()
	inputFile = fopen ("Input.txt", "r");
	## create an empty cell array to store the most common letter and its count for each line
  	retval = {};
	while (!feof (inputFile))
		## read a line from the file
		line = fgetl(inputFile);

		## call countLetters on the line and find the most common letter
		[maxVal, index] = max(countLetters(line));
	    if(length(retval) == 0)

			## if retval is empty, add the most common letter and its count to retval
		    retval(1, 1) = char(index + 96);
		    retval(1, 2) = maxVal;
		else
			retval(length(retval)+1, 1) = char(index + 96); 
		    retval(length(retval), 2) = maxVal; 
		end
	end
	##	remove the second row of retval since it is not needed for the final output
	retval(2, :) = [];
end

disp(starterFunction());

