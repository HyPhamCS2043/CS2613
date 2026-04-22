% ── OCTAVE ──────────────────────────────────────────────────────────
% Each class must be in its own .m file!
% REMEMBER: Octave setters must reassign the object: a = a.setName("x") or the change is lost.


% ---- Animal.m ----
classdef Animal
    properties (Access = private)
        name
        sound
    end
    methods
        function obj = Animal(name, sound)  % Constructor
            obj.name  = name;
            obj.sound = sound;
        end
        function r = getName(obj),  r = obj.name;  end  % Getters
        function r = getSound(obj), r = obj.sound; end
        function obj = setName(obj, v),  obj.name  = v; end  % Setters
        function obj = setSound(obj, v), obj.sound = v; end
        function speak(obj)
            fprintf('%s says %s!\n', obj.name, obj.sound);
        end
    end
end

% ---- Dog.m ----
classdef Dog < Animal                       % Inheritance
    properties (Access = private)
        breed
    end
    methods
        function obj = Dog(name, breed)
            obj = obj@Animal(name, 'Woof'); % Call parent constructor
            obj.breed = breed;
        end
        function r = getBreed(obj), r = obj.breed;  end
        function obj = setBreed(obj, v), obj.breed = v; end
        function speak(obj)                 % Override
            fprintf('%s the %s says %s!\n', obj.getName(), obj.breed, obj.getSound());
        end
    end
end

% ---- main.m ----
a = Animal('Cat', 'Meow');
a.speak();                                  % Cat says Meow!
a = a.setName('Kitten');
a.speak();                                  % Kitten says Meow!

d = Dog('Rex', 'Labrador');
d.speak();                                  % Rex the Labrador says Woof!
d = d.setName('Max');
d = d.setBreed('Poodle');
d.speak();                                  % Max the Poodle says Woof!
fprintf('%s %s %s\n', d.getName(), d.getBreed(), d.getSound()); % Max Poodle Woof