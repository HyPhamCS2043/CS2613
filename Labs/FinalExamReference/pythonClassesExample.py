from abc import ABC, abstractmethod

# Abstract base class
class Shape(ABC):
    def __init__(self, color):
        self.color = color

    @abstractmethod
    def area(self):
        pass

    @abstractmethod
    def perimeter(self):
        pass

    def describe(self):
        print(f"I am a {self.color} {self.__class__.__name__}")
        print(f"  Area:      {self.area():.2f}")
        print(f"  Perimeter: {self.perimeter():.2f}")


# Subclass 1
class Circle(Shape):
    def __init__(self, color, radius):
        super().__init__(color)
        self.radius = radius

    def area(self):
        return 3.14159 * self.radius ** 2

    def perimeter(self):
        return 2 * 3.14159 * self.radius


# Subclass 2
class Rectangle(Shape):
    def __init__(self, color, width, height):
        super().__init__(color)
        self.width = width
        self.height = height

    def area(self):
        return self.width * self.height

    def perimeter(self):
        return 2 * (self.width + self.height)


# --- Main ---
shapes = [
    Circle("red", radius=5),
    Rectangle("blue", width=4, height=6)
]

for shape in shapes:
    shape.describe()
    print()