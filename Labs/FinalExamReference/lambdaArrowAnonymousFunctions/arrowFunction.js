// ── JAVASCRIPT ──────────────────────────────────────────────────────

// Basic arrow function
const square = x => x ** 2;
console.log(square(5));                 // 25

// Multiple parameters (need parentheses)
const add = (x, y) => x + y;
console.log(add(3, 4));                 // 7

// Multi-line arrow function (need curly braces + return)
const addVerbose = (x, y) => {
    const result = x + y;
    return result;
};

// Used inline with built-ins
const nums = [1, 2, 3, 4, 5];
const evens   = nums.filter(x => x % 2 === 0);
const doubled = nums.map(x => x * 2);
console.log(evens);                     // [2, 4]
console.log(doubled);                   // [2, 4, 6, 8, 10]

// Returning an arrow function from a function
const multiplier = n => x => x * n;

const triple = multiplier(3);
console.log(triple(7));                 // 21