; ── RACKET ──────────────────────────────────────────────────────────

; Basic lambda
(define square (lambda (x) (* x x)))
(display (square 5))                    ; 25
(newline)

; Multiple parameters
(define add (lambda (x y) (+ x y)))
(display (add 3 4))                     ; 7
(newline)

; Used inline with built-ins
(define nums '(1 2 3 4 5))
(define evens   (filter (lambda (x) (= (modulo x 2) 0)) nums))
(define doubled (map    (lambda (x) (* x 2))             nums))
(display evens)                         ; (2 4)
(newline)
(display doubled)                       ; (2 4 6 8 10)
(newline)

; Returning a lambda from a function
(define (multiplier n)
  (lambda (x) (* x n)))

(define triple (multiplier 3))
(display (triple 7))                    ; 21
(newline)