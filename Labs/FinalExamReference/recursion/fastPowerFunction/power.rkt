; Racket - fast version O(log n)
(define (power base exp)
  (cond [(= exp 0) 1]
        [(even? exp) (let ([half (power base (/ exp 2))])
                       (* half half))]
        [else (* base (power base (- exp 1)))]))

(display (power 2 10))                  ; 1024