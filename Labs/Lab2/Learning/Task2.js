//Author: Hy Pham
//3644179

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

const prompt = require('prompt-sync')({sigint: true});

let repeat = true;
console.log("Select a commnand:\n\tn: Check a value\n\tq: Quit\n");
let command = prompt();

while(repeat) {
    //console.log("Select a commnand:\n\tn: Check a value\n\tq: Quit\n");
    //let command = prompt();
    if (command === 'n') {
        const numberIn = prompt();
        let n = Number(numberIn);
        
        let f = is_factorial(n);

        if (f === -1) {
            console.log(n + " is a negative number.")
        } else if (f === 0) {
            console.log(n + " is not the factorial of another number");
        } else {
            console.log(n + " is the factorial result of " + f);
        }

    } else if (command === 'q') {
        process.exit(1);
    } 
    command = prompt("New command: ")
}







