//Author: Hy Pham
//3644179

//A program to print out a chess board based on set size, using # to represent the black square,
//and space to represent white square.

const size = 10;
let currentSymbol = " "; // The current "color" or symbol of the chess square

for (let i = 0; i < size; i++) {
    let currentLine = "";

    for(let j = 0; j < size; j ++) {
        currentLine += currentSymbol;

         // Switch the current symbol to the other one to simulate alternating black and white
        if (currentSymbol === " ") {
            currentSymbol = "#";
        } else {
            currentSymbol = " ";
        }
    }

    console.log(currentLine);

    // If the board has an even length, then 
    // switch the current symbol to the other one before starting new line
    if(size%2 === 0) {
        if (currentSymbol === " ") {
            currentSymbol = "#";
        } else {
            currentSymbol = " ";
        }
    }
    
}