classdef aquarium
    properties
        numOfExhibit = 0;
        animals = cell (1, 1)
    endproperties

    methods
        function a = aquarium (animalIn)
            if (nargin != 1)
                print_usage();
            endif

            if (nargin >= 1)
                if (iscell (animalIn) && iscellstr (animalIn))
                    a.animals = animalIn;
                    a.numOfExhibit = length(a.animals);
                elseif (isreal (animalIn) && ischar (animalIn))
                    a.animals = cellstr (animalIn);
                    a.numOfExhibit = length(a.animals);
                else
                    error("aquarium: animalIn must be either a cell array of string OR a char array.")
                endif
            endif
        endfunction

        function disp (a)
            num = a.numOfExhibit;
            current = a.animals;
            printf("There are currently %d exhibits at the aquarium.\n", num);
            if (num == 0)
                disp("There are no animals here right now.\n");
            else
                for i = 1 : num;
                    disp(current{i, 1});
                endfor
            endif
        endfunction

        function val = get (a, prop)

            if (nargin < 1 || nargin > 2)
                print_usage ();
            endif

            if (nargin == 1)
                val.numOfExhibit = a.numOfExhibit;
                val.animals = a.animals;
            else
                if (! ischar (prop))
                    error ("Property must be a string");
                endif

                switch (prop)
                    case "numOfExhibit"
                        val = a.numOfExhibit;
                    case "animals"
                        val = a.animals;
                    otherwise
                        error ('Invalide property "%s"', prop);
                endswitch
            endif
        endfunction
        
        function toset = set (a, val)

            toset = a;

            ##if (! (iscell (val) && iscellstr (val)) || ! (isreal (val) && ischar (val)))
            ##    error ("Expecting either string array or cell array of strings");
            ##endif

            toset.animals = cellstr (val);
            toset.numOfExhibit = length (toset.animals);
        endfunction 

        function retval = firstAnimal (a)
            retval = a.animals {1, 1};
        endfunction

    endmethods
endclassdef