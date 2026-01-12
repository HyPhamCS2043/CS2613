//Author: Hy Pham
//3644179
//Reference: https://math.stackexchange.com/questions/171882/is-there-a-way-to-reverse-factorials


function is_factorial(num) {
    if (num < 0) {
        return -1;
    } 
    else if (num == 1) {
        return num;
    }

    let d = 2;
    while (num > 1) {
        num  = num / d;
        d += 1;
    }

    if (num %1 === 0) {
        return d-1;
    } 
    else {
        return 0;
    }
}

console.log("is_factorial(6) returns " + is_factorial(6));
console.log("is_factorial(8) returns " + is_factorial(8));
console.log("is_factorial(120) returns " + is_factorial(120));
console.log("is_factorial(1) returns " + is_factorial(1))
console.log("is_factorial(-7) returns " + is_factorial(-7))