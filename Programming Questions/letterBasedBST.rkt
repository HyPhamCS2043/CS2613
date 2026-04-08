#lang racket
(require racket/class)

(define LetterNode% (class object%
                      (super-new)
                      (init-field [left null] [right null] [letter null] [frequency 1])
                      (define leftNode left)
                      (define rightNode right)
                      (define l letter)
                      (define freq frequency)
                      (define/public (get-left)
                        leftNode)
                      (define/public (get-right)
                        rightNode)
                      (define/public (get-letter)
                        l)
                      (define/public (get-frequency)
                        freq)
                      (define/public (set-left leftIn)
                        (set! leftNode leftIn))
                      (define/public (set-right rightIn)
                        (set! rightNode rightIn))
                      (define/public (set-letter letterIn)
                        (set! l letterIn))
                      (define/public (set-frequency freqIn)
                        (set! freq freqIn))
                      (define/public (increment-frequency)
                        (set-frequency (+ (get-frequency) 1)))
                      ))
                        

;(define test1 (make-object LetterNode% null null "h" 1))
;(define test2 (make-object LetterNode% null null "e" 1))
;(define test3 (make-object LetterNode% null null "l" 1))


(define BST% (class object%
               (super-new)
               (init-field [headNode null])
               (define head headNode)
               (define/public (insert node)
                 (set! head (insert-help head node)))
               (define/public (insert-help root node)
                 (cond
                   [(null? root) node]
                   ;If the string in node is less than root node (ealier in the alphabet) then call insert-help on the left node.
                   ;Call root here to pass the value back up the chain
                   [(string<? (string-downcase (send node get-letter))(string-downcase(send root get-letter)))
                    (send root set-left (insert-help (send root get-left) node))
                    root]
                   ;If the string in node is more than root node (later in the alphabet) then call insert-help on the right node.
                   ;Call root here to pass the value back up the chain
                   [(string>? (string-downcase (send node get-letter))(string-downcase(send root get-letter)))
                    (send root set-right (insert-help (send root get-right) node))
                    root]
                   ;else both nodes must have the same string, therefore increment the frequency of the root node
                   ;Call root here to pass the value back up the chain
                   [else
                    (send root increment-frequency)
                    root]))
               (define/public (get-head)
                        head)
               (define/public (print node)
                 (cond
                   [(null? node) (void)]
                   [else
                    (print (send node get-left))
                    (displayln (string-append (send node get-letter) ": "(number->string (send node get-frequency))))
                    (print (send node get-right))]))
               (define/public (print-tree)
                 (print head))))

(define (word->tree word tree)
  (cond
    [(= (string-length word) 0) (void)]
    [else
     (define node (make-object LetterNode% null null (string(string-ref word 0)) 1))
     (send tree insert node)
     (word->tree (substring word 1 (string-length word)) tree)]))
  
(define tree (make-object BST% null))
(word->tree "HelLloOOOO" tree)
(send tree print-tree)