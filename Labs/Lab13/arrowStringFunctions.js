//Author: Hy Pham
//3644179

//Arrow function that returns true if only the first letter of the string and 
// the first letter after any space is capital.
const upperCaseCheck = (str) => {
    let arr = str.split(" ");
    retval = true
    for (let i = 0; i < arr.length; i++) {
        let current = arr[i];
        for (let k = 0; k < current.length; k++) {
            if (k == 0) {
                if (current.charCodeAt(k) >= 97 && current.charCodeAt(k) <= 122) {
                    return !retval;
                }
            } else {
                 if (current.charCodeAt(k) >= 65 && current.charCodeAt(k) <= 90) {
                    return !retval;
                }
            }
            
        }
    }
    return retval;
}

//let input = "This Is A Test";
//console.log (upperCaseCheck(input));

//Arrow function that checks if there is only one space in the string
const oneSpaceOnly = (str) => {
    let arr = str.split(" ");
    if (arr.length == 2) {
        return true;
    } else {
        return false;
    }
}

//let input2 = "This is";
//console.log(oneSpaceOnly(input2));

//Arrow function that checks the first token (word) and the second token (word) separated by a space and
//sees if the first word ends with the same letter the second word begins with.
const first2TokensCheck = (str) => {
    let arr = str.split(" ");
    if (arr.length < 2) {
        return false;
    }

    let lastCharFirstToken = arr[0].charAt(arr[0].length - 1).toLowerCase();
    let firstCharSecondToken = arr[1].charAt(0).toLowerCase();
    if (lastCharFirstToken == firstCharSecondToken) {
        return true;
    }
    else {
        return false;
    }
}

//let input3 = "Margaret Ryan";
//let input4 = "Catherine Elaine Guil Avery"
//console.log(first2TokensCheck(input3));
//console.log(first2TokensCheck(input4));

function stringFilters(strArr, funcArr) {
    let retArr = [];
    for (let i = 0; i < strArr.length; i++) {
        let passed = true;
        //console.log("Current string: " + strArr[i]);
        for (let k = 0; k < funcArr.length; k++) {
            
            //console.log("Current function: " + funcArr[k])
            //console.log(funcArr[k](strArr[i]))
            if (!funcArr[k](strArr[i])) {
                passed = false;
            }
        }
        if (passed) {
            retArr.push(strArr[i]);
        }
    }
    return retArr;
}

let inputStrArr = ["Test Test", "This is a test", "This Is A Test",
"Catherine Elaine", "Catherine Elaine Guil", "",
"Does this pass?", "Question Node.js"];

let inputFuncArr = [upperCaseCheck, oneSpaceOnly, first2TokensCheck];

console.log(stringFilters(inputStrArr, inputFuncArr));

//let strcheck = "Question Node.js";
//console.log(strcheck.split(" "));
//console.log(upperCaseCheck("Question Node.js"));
//console.log(strcheck.charCodeAt(13));
//console.log(oneSpaceOnly("Question Node.js"));
//console.log(first2TokensCheck("Question Node.js"));