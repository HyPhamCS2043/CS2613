// ── JAVASCRIPT ──────────────────────────────────────────────────────

class Animal {
    #name;                           // Private fields
    #sound;

    constructor(name, sound) {
        this.#name  = name;
        this.#sound = sound;
    }

    get name()  { return this.#name;  }  // Getters
    get sound() { return this.#sound; }
    set name(v)  { this.#name  = v;   }  // Setters
    set sound(v) { this.#sound = v;   }

    speak() {
        console.log(`${this.#name} says ${this.#sound}!`);
    }
}

class Dog extends Animal {               // Inheritance
    #breed;

    constructor(name, breed) {
        super(name, "Woof");             // Call parent constructor
        this.#breed = breed;
    }

    get breed()  { return this.#breed; }
    set breed(v) { this.#breed = v;    }

    speak() {                            // Override
        console.log(`${this.name} the ${this.#breed} says ${this.sound}!`);
    }
}

const a = new Animal("Cat", "Meow");
a.speak();                               // Cat says Meow!
a.name = "Kitten";
a.speak();                               // Kitten says Meow!

const d = new Dog("Rex", "Labrador");
d.speak();                               // Rex the Labrador says Woof!
d.name  = "Max";
d.breed = "Poodle";
d.speak();                               // Max the Poodle says Woof!
console.log(d.name, d.breed, d.sound);   // Max Poodle Woof