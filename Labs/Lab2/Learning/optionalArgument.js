//Author: Hy Pham
//3644179

//If you write an = operator after a parameter, followed by an expression, 
//the value of that expression will replace the argument when it is not given.
function printBoth(a, b = "World!") {
    console.log(a + " " + b);
}
printBoth("Hello");
printBoth("Hello", "Stranger");