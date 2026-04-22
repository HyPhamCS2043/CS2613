#lang racket

(define bank-account%
  (class object%
    ;; init field
    (init-field balance)

    ;; public methods
    (define/public (deposit amount)
      (set! balance (+ balance amount)))

    (define/public (withdraw amount)
      (if (>= balance amount)
          (set! balance (- balance amount))
          "Insufficient funds"))

    (define/public (get-balance)
      balance)

    (define/public (transfer other-account amount)
      (if (>= balance amount)
          (begin
            (set! balance (- balance amount))
            (send other-account deposit amount))
          "Insufficient funds"))

    ;; superclass initialization
    (super-new)))