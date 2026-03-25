#lang racket
(require racket/class)

(define point% (class object%
                 (super-new)
                 (init-field x y)
                 (define x-val x)
                 (define y-val y)
                 (define/public (get-x)
                   x-val)
                 (define/public (get-y)
                   y-val)
                 (define/public (distance other)
                   (sqrt (+ (expt (- x-val (send other get-x)) 2) (expt (- y-val (send other get-y)) 2))))
                 (define/public (set-x nx)
                   (set! x-val nx))
                 (define/public (set-y ny)
                   (set! y-val ny))
                   ))

(define p1 (make-object point% 9 3))
(define p2 (make-object point% -1 2))
(send p1 distance p2) 
