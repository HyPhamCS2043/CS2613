class Pet:
    def __init__(self, name):
        self.name = name

    def speak(self):
        return "Some sound"

    def get_name(self):
        return self.name

    def is_loud(self):
        return False  # default


class Dog(Pet):
    def speak(self):
        return "Woof"

    def is_loud(self):
        return True


class Cat(Pet):
    def speak(self):
        return "Meow"

    def is_loud(self):
        return False


# Main terminal I/O loop
pets = []

while True:
    pet_type = input("Enter pet type (dog/cat) or 'done': ").strip().lower()

    if pet_type == "done":
        break

    if pet_type not in ["dog", "cat"]:
        print("Invalid pet type. Try again.\n")
        continue

    name = input("Enter pet name: ").strip()

    if pet_type == "dog":
        pet = Dog(name)
    else:
        pet = Cat(name)

    pets.append(pet)
    print()  # blank line for readability

# Display all pets and their sounds
print("\n--- Pet Sounds ---")
for pet in pets:
    sound = pet.speak()
    name = pet.get_name()

    if pet.is_loud():
        print(f"{name} says {sound}. {name} is loud.")
    else:
        print(f"{name} says {sound} {name} is quiet.")