//Author: Hy Pham
//Student number: 3644179


import fs from 'fs';

testArr = [1.0, 2.0, 3.0, 4.0, 5.0]
//Function to calculate the sum of all numbers in the input list
function calSum (inputArr) {
    let curSum = 0
    for (i = 0; i < inputArr.length ; i++) {
        curSum += Number(inputArr[i])
    }
    return curSum
}
console.log(calSum(testArr))

//#Function to calculate the average of all numbers in the input list
function calAvg(inputArr) {
    return calSum(inputArr)/inputArr.length
}
console.log(calAvg(testArr))

//Function to calculate the largest value of the input list
function calMax(inputArr) {
    let curMax = inputArr[0]
    for (i = 1 ; i < inputArr.length; i++) {
        if (inputArr[i] > curMax) {
            curMax = inputArr[i]
        }
    }
    return curMax
}
console.log(calMax(testArr))

//Function to calculate the smallest value of the input list
function calMin(inputArr) {
    let curMin = inputArr[0]
    for (i = 1 ; i < inputArr.length; i++) {
        if (inputArr[i] < curMin) {
            curMin = inputArr[i]
        }
    }
    return curMin
}
console.log(calMin(testArr))

//Function that recursively calculate the factorial value of the input num
function factorial(num) {
    if (num === 1 || num === 0) {
        return 1
    }
    else {
        return num * factorial(num - 1)
    }
}

console.log('Factorial of 5 is', factorial(5))

//Function that calculate the power of input number to input exponent
function power(num, exponent) {
    if (exponent === 0){
        return 1
    } else {
        let output = num
        let i = 1
        while (i < exponent) {
            output *= num
            i++
        }
        return output
    }
}
console.log("2 to the power of 3 is", power(2, 3))

//Function that approximate exponential function for each value in input list
function calExpo(inputArr) {
    let outputArr = []
    for (i = 0; i < inputArr.length; i ++) {
        let curCalResult = 0
        for (k = 0; k <= 50; k ++) {
            curCalResult += (power(inputArr[i], k))/factorial(k)
        }
        outputArr.push(curCalResult)
    }
    return outputArr
}
var output = calExpo(testArr)
console.log(output.join(", "))

//#Function that approximate the Poisson distribution for each value in input list
function calPoisson(inputArr) {
    let outputArr = []
     for (i = 0; i < inputArr.length; i ++) {
        let curCalResult = 0
        for (k = 0; k <= 50; k ++) {
            curCalResult += k * (power(inputArr[i], k))/factorial(k)
        }
        outputArr.push(curCalResult)
    }
    return outputArr
}
console.log(calPoisson(testArr).join(", "))

//Function that approximate the Sin value for each value in input list
function calSin(inputArr) {
    let outputArr = []
     for (i = 0; i < inputArr.length; i ++) {
        let curCalResult = 0
        for (k = 0; k <= 50; k ++) {
            let key = 2 * k + 1
            curCalResult += power(-1, k) * (power(inputArr[i], key))/factorial(key)
        }
        outputArr.push(curCalResult)
    }
    return outputArr
}
console.log(calSin(testArr).join(", "))

//Function that approximate cosine value for each value in input list
function calCos(inputArr) {
    let outputArr = []
     for (i = 0; i < inputArr.length; i ++) {
        let curCalResult = 0
        for (k = 0; k <= 50; k ++) {
            let key = 2 * k 
            curCalResult += power(-1, k) * (power(inputArr[i], key))/factorial(key)
        }
        outputArr.push(curCalResult)
    }
    return outputArr
}
console.log(calCos(testArr).join(", "))

//Synchronous File I/O
//Include the fs module
const fs = require('fs')

try {
    const inputFile = fs.readFileSync('DataInput.txt', { encoding: 'utf8', flag: 'r' });
} catch (err) {
    console.error('Error reading file:', err);
}