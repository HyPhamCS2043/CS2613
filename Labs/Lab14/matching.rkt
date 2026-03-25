#lang racket
;Author: Hy Pham
;Student ID: 3644179
;Function that takes 2 lists and a starting position. It then returns the position
;of the 1st occurence in the list where the values are less than 1 apart
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