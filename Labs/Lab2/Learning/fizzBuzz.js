//Author: Hy Pham
//3644179

//A program to print the number 1 to 100, but replacing number divisible by 3 with Fizz,
//number divisible by 5 with Buzz, and number divisible by both 3 and 5 with FizzBuzz

for (let i = 1; i <= 100; i++) {
    let toPrint = ""
    if (i%3 === 0) {
        toPrint += "Fizz";
    }
    if  (i%5 === 0) {
        toPrint += "Buzz";
    }
    if (i%3 !==0 && i%5 !== 0) {
        toPrint = i.toString();
    }
    console.log(toPrint);
}