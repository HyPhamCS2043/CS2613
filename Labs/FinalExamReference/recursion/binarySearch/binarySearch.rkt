; Racket
(define (binary-search vec target lo hi)
  (if (> lo hi) -1
      (let* ([mid  (quotient (+ lo hi) 2)]
             [val  (vector-ref vec mid)])
        (cond [(= val target) mid]
              [(< val target) (binary-search vec target (+ mid 1) hi)]
              [else           (binary-search vec target lo (- mid 1))]))))

(display (binary-search #(1 3 5 7 9 11) 7 0 5)) ; 3