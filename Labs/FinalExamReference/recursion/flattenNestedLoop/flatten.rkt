; Racket
(define (flatten lst)
  (cond [(null? lst) '()]
        [(list? (car lst)) (append (flatten (car lst)) (flatten (cdr lst)))]
        [else (cons (car lst) (flatten (cdr lst)))]))

(display (flatten '(1 (2 (3 4)) 5)))    ; (1 2 3 4 5)