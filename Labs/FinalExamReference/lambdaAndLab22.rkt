#lang racket

;Some reference lambda function
((lambda (x) (* x 2)) 10)


(define inputList (range 10 21))

;Example of function with no param and build-list
;calling this returns a list from 10 to 20
;since it makes a list from output of past 0 to 10 to lambda
(define (transformList)
  (define outList (build-list 11 (lambda (x)(+ x 10))))
  outList
  )

(define (piecewise x)
  (if (even? x)(/ x 2)(* x 2)))

;;Example of if statement in lambda
(lambda (x)(if (even? x)(/ x 2)(* x 2)))

(define (transformEvenOdd)
  (define out '())
  ;;inner recursive function to construct the list
  ;;accept an integer as input. x is the iteration control
  (define (inner x)
    (cond
      ;;if x is > 20, return empty list up the recursion call
      [(> x 20) out]
      [else
       ;;if x is not > 20, then construct a list with x (with piecewise lambda function applied)
       ;; and the output of the recursion call with x increment by 1
       (cons ((lambda (x)(if (even? x)(/ x 2)(* x 2))) x)(inner (+ x 1)))])
    )
  ;; call the inner recursive function
  (inner 10)
 )

(transformEvenOdd)
