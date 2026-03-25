#lang racket
;Author: Hy Pham
;Student ID: 3644179

(define (decal t)
  (+ 32 (* -0.35 t)))

(define (accel t)
  (+ 5 (* 0.5 t)))

(define (matching list1 list2 pos)
  (cond
    ;Check if the lists are empty, is yes return -1
    [(or (null? list1)(null? list2)) -1]
    [else
     ;Calculate the difference between the first values of each list into compareVal
     (define compareVal (abs (- (car list1)(car list2))))
     (cond
       ;if compareVal is less than tolerance of 1, return current position
       [(< compareVal 1)  pos]
       ;Call function again with list1 and list2 without the first value,
       ;while incrementing current position pos by 1
       [else (matching (drop list1 1) (drop list2 1) (+ pos 1))])]))

(define (list_60 n)
 list (range n 61))

(define (same-speed veloFunc1 veloFunc2 seconds)
  (define secondCloseTogether 0)
  ;Applying each function to the list "seconds"
  (matching (map veloFunc1 seconds)(map veloFunc2 seconds) 0))

(same-speed accel decal (list_60 0))