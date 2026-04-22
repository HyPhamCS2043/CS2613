// JavaScript
function sumList(arr) {
    if (arr.length === 0) return 0;
    return arr[0] + sumList(arr.slice(1));
}

console.log(sumList([1, 2, 3, 4, 5]));  // 15