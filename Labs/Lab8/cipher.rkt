#lang racket

(define (cipher word key start)
  (cipherRecur word key start (list)))

(define (cipherRecur word key start charList)
  (cond
    [(= start (string-length word)) charList]
    [else (define cur (char->integer (string-ref word start)))
          (define new (+ cur key))
          (define returnList (append charList (list (integer->char new))))
          (cipherRecur word key (+ start 1) returnList)]))
  