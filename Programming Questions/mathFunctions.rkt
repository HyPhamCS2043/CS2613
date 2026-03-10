#lang racket
(define test (list 1.0 2.0 3.0 4.0 5.0))

;function to calculate the sum of all elements in a list
(define (listSum lst)
  (apply + lst))

(listSum test)

;Function to calculate the average of all elements in a list
(define (listAvg lst)
  (/ (listSum lst)(length lst)))

(listAvg test)

;Function to determine the largest value of all elements in a list
(define (listMax lst)
  (define curMax (first lst))
  (for ([i (rest lst)])
    (cond
      [(> i curMax)(set! curMax i)]))
  curMax)

(listMax test)

;Function to determine the smallest value of all elements in a list
(define (listMin lst)
  (define curMin (first lst))
  (for ([i (rest lst)])
    (cond
      [(< i curMin)(set! curMin i)]))
  curMin)

(listMin test)

;Function to calculate the factorial of input num
(define (factorial num)
  (cond
    [(or (= num 0)(= num 1)) 1]
    [else (* num (factorial (- num 1)))]))

;(factorial 5)

;Function to recursively calculate input number to the power of non-negative expo
(define (power num expo)
  (cond
    [(= expo 0) 1]
    [else (* num (power num (- expo 1)))]))

;(power 2 3)

;Function to approximate exponential value for each value in the input list
(define (calExpo lst)
  ;Iterate through input list lst one element at a time. Result of each iteration
  ;is stored in a list
  (for/list ([i lst])
    ;curCalResult stores the accumulation of all iterations from k = 0 to 50
    (for/fold ([curCalResult 0])
              ([k (range 51.0)])
      (+ curCalResult (exact->inexact (/ (power i k) (factorial k)))))))

(calExpo test)

;Function that approximate the Poisson distribution for each value in the input list
(define (calPoisson lst)
  ;Iterate through input list lst one element at a time. Result of each iteration
  ;is stored in a list
  (for/list ([i lst])
    ;curCalResult stores the accumulation of all iterations from k = 0 to 50
    (for/fold ([curCalResult 0])
              ([k (range 51.0)])
      (+ curCalResult (exact->inexact (* k (/ (power i k) (factorial k))))))))

(calPoisson test)

;#Function that approximate the Sin value for each value in input list
(define (calSin lst)
  ;Iterate through input list lst one element at a time. Result of each iteration
  ;is stored in a list
  (for/list ([i lst])
    ;curCalResult stores the accumulation of all iterations from k = 0 to 50
    (for/fold ([curCalResult 0])
              ([k (range 51.0)])
      (define key (+ 1 (* 2 k)))
      (+ curCalResult (exact->inexact (* (power -1 k) (/ (power i key) (factorial key))))))))

(calSin test)

;Function that approximate cosine value for each value in input list
(define (calCos lst)
  ;Iterate through input list lst one element at a time. Result of each iteration
  ;is stored in a list
  (for/list ([i lst])
    ;curCalResult stores the accumulation of all iterations from k = 0 to 50
    (for/fold ([curCalResult 0])
              ([k (range 51.0)])
      (define key (* 2 k))
      (+ curCalResult (exact->inexact (* (power -1 k) (/ (power i key) (factorial key))))))))

(calCos test)