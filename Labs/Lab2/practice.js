//Author: Hy Pham
//3644179

console.log("Hello World, I'm JS");

//Examples of how logical operator returns original value on either left 
//or right side of the operator, depending on which one can be convert to 
//"True" or "False"

//The && operator returns left value if the left can be convert to false, else it prints
//right value
console.log(0 && "name")
// → 0
console.log("name" && null)
// → null
console.log("name" && "number")
// → name

//The || operator will return the value to its left when that value can be converted to true 
// and will return the value on its right otherwise.
console.log(null || "user")
// → user
console.log("Agnes" || "user")
// → Agnes

//The ?? operator resembles || but returns the value on the right only if the one on the left 
// is null or undefined
console.log(0 ?? 100);
// → 0
console.log(null ?? 100);
// → 100