// JavaScript
function binarySearch(arr, target, lo, hi) {
    if (lo > hi) return -1;
    const mid = Math.floor((lo + hi) / 2);
    if (arr[mid] === target) return mid;
    if (arr[mid]  < target) return binarySearch(arr, target, mid + 1, hi);
    return binarySearch(arr, target, lo, mid - 1);
}

const arr = [1, 3, 5, 7, 9, 11];
console.log(binarySearch(arr, 7, 0, arr.length - 1)); // 3