; Racket
(define (sum-list lst)
  (if (null? lst) 0
      (+ (car lst) (sum-list (cdr lst)))))

(display (sum-list '(1 2 3 4 5)))       ; 15