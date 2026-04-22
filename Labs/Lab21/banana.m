classdef Banana < Fruit
    properties (Access = private)
        length
    end
    
    methods
        function obj = Banana(length)
            obj@Fruit("Banana");
            obj.length = length;
        end
        
        function result = getLength(obj)
            result = obj.length;
        end
        
        function obj = setLength(obj, newLength)
            obj.length = newLength;
        end
        
        function result = describe(obj)
            result = "This banana is " + num2str(obj.length) + " inches long";
        end
        
        function result = isSweet(obj)
            result = obj.length > 7;
        end
    end
end