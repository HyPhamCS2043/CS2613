; ── RACKET ──────────────────────────────────────────────────────────

; Output
(display "Hello, World!")                       ; no newline
(newline)
(displayln "Hello again!")                      ; with newline
(printf "Name: ~a, Age: ~a\n" "Alice" 30)       ; formatted, ~a = value
(printf "Float: ~a\n" (exact->inexact 1/3))     ; fraction to decimal

; Input
(display "Enter your name: ")
(define name (read-line))                       ; read as string

(display "Enter your age: ")
(define age (read))                             ; read as number

(printf "Hello ~a, you are ~a years old!\n" name age)