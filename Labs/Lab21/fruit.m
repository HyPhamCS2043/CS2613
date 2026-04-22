classdef Fruit
    properties (Access = private)
        name
    end
    
    methods
        function obj = Fruit(name)
            obj.name = name;
        end
        
        % Accessor
        function result = getName(obj)
            result = obj.name;
        end
        
        % Mutator
        function obj = setName(obj, newName)
            obj.name = newName;
        end
        
        function result = describe(obj)
            result = "This is a fruit";
        end
    end
end