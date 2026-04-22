// JavaScript - fast version O(log n)
function power(base, exp) {
    if (exp === 0) return 1;
    if (exp % 2 === 0) {
        const half = power(base, exp / 2);
        return half * half;
    }
    return base * power(base, exp - 1);
}

console.log(power(2, 10));              // 1024