#lang racket

;Author: Hy Pham
;Student ID: 3644179

(require racket/port)

;(define test (list 1.0 2.0 3.0 4.0 5.0))

;function to calculate the sum of all elements in a list
(define (calSum lst)
  (apply + lst))

;(calSum test)

;Function to calculate the average of all elements in a list
(define (calAvg lst)
  (/ (calSum lst)(length lst)))

;(calAvg test)

;Function to determine the largest value of all elements in a list
(define (calMax lst)
  (define curMax (first lst))
  (for ([i (rest lst)])
    (cond
      [(> i curMax)(set! curMax i)]))
  curMax)

;(listMax test)

;Function to determine the smallest value of all elements in a list
(define (calMin lst)
  (define curMin (first lst))
  (for ([i (rest lst)])
    (cond
      [(< i curMin)(set! curMin i)]))
  curMin)

;(listMin test)

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

;(calExpo test)

;Function that approximate the Poisson distribution for each value in the input list
(define (calPoisson lst)
  ;Iterate through input list lst one element at a time. Result of each iteration
  ;is stored in a list
  (for/list ([i lst])
    ;curCalResult stores the accumulation of all iterations from k = 0 to 50
    (for/fold ([curCalResult 0])
              ([k (range 51.0)])
      (+ curCalResult (exact->inexact (* k (/ (power i k) (factorial k))))))))

;(calPoisson test)

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

;(calSin test)

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

;(calCos test)

;Function reads in the number of values n from the text file
;Then, iteratively go through the file line by line and collects the next n values into a list
(define (valToList in)
  (define numVal (string->number (read-line in)))
  (for/list ([i numVal])
    (string->number (read-line in))))

;Function to read in the input file and write the calculation results to
;a text output file
(define (fileReader in out)
  (for ([l (in-lines in)])
    (cond
      [(equal? (string-trim l) "END") (display "Successfully readfile\n")]
      [(equal? (string-trim l) "SUM")
       (display (calSum (valToList in)) out)
       (display "\n" out)]
      [(equal? (string-trim l) "AVG")
       (display (calAvg (valToList in)) out)
       (display "\n" out)]
      [(equal? (string-trim l) "MAX")
       (display (calMax (valToList in)) out)
       (display "\n" out)]
      [(equal? (string-trim l) "MIN")
       (display (calMin (valToList in)) out)
       (display "\n" out)]
      [(equal? (string-trim l) "FXP")
       (display (calExpo (valToList in)) out)
       (display "\n" out)]
      [(equal? (string-trim l) "FPO")
       (display (calPoisson (valToList in)) out)
       (display "\n" out)]
      [(equal? (string-trim l) "FSN")
       (display (calSin (valToList in)) out)
       (display "\n" out)]
      [(equal? (string-trim l) "FCS")
       (display (calCos (valToList in)) out)
       (display "\n" out)])
    ))


(define input1 (open-input-file "SampleInputFiles/DataInput.txt"))

(define input2 (open-input-file "SampleInputFiles/DataInput2.txt"))

(define output1 (open-output-file "Q1Output.txt" #:exists 'can-update))

(define output2 (open-output-file "Q2Output.txt" #:exists 'can-update))

(fileReader input1 output1)
(close-input-port input1)
(close-output-port output1)

(fileReader input2 output2)
(close-input-port input2)
(close-output-port output2)

;For future reference purpose: call-with-input-file example
;(call-with-input-file "SampleInputFiles/DataInput.txt"
;  (lambda (out)
;   (fileReader out)))