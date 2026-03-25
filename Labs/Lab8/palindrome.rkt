#lang racket

(define (palindrome str)
  (cond
    [(= (string-length str) 1) #t]
    ;\s* means any number of white spaces. This line means if the string contains only white spaces it is palindrome
    [(regexp-match-exact? #px"\\s*" str) #t]
    ;Compare first char in string and last one.
    ;If the same, recur by passing to function palindrome the substring starting with first and last char removed
    [(char=? (string-ref str 0)(string-ref str (- (string-length str) 1))) (palindrome (substring str 1 (- (string-length str) 1)))]
    [else #f]))

