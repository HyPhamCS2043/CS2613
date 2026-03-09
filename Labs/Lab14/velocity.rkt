#lang racket
(define (decal t)
  (+ 32 (* -0.35 t)))

(define (accel t)
  (+ 5 (* 0.5 t)))