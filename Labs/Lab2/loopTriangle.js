//Author: Hy Pham
//3644179

//Print out a triangle made out of #
for(let i = 0; i < 7; i++) {
    let currentLine = "";
    for(let j = i+1; j > 0; j --) {
        currentLine += "#";
    }
    console.log(currentLine);
}