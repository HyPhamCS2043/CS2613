#lang racket

(define (palindrome str)
  (cond
    [(= (string-length str) 1) #t]
    [(regexp-match-exact? #px"\\s*" str) #t]
    [(char=? (string-ref str 0)(string-ref str (- (string-length str) 1))) (palindrome (substring str 1 (- (string-length str) 1)))]
    [else #f]))

