classdef Apple < Fruit
    properties (Access = private)
        color
    end
    
    methods
        function obj = Apple(color)
            obj@Fruit("Apple");
            obj.color = color;
        end
        
        % Accessor
        function result = getColor(obj)
            result = obj.color;
        end
        
        % Mutator
        function obj = setColor(obj, newColor)
            obj.color = newColor;
        end
        
        function result = describe(obj)
            result = "This is a " + obj.color + " apple";
        end
    end
end