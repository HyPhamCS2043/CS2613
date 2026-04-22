#lang racket

;; ── Base class: Animal ──────────────────────────────────────────────
(define animal%
  (class object%
    (super-new)

    ;; Fields
    (init-field name sound)

    ;; Getters
    (define/public (get-name)  name)
    (define/public (get-sound) sound)

    ;; Setters
    (define/public (set-name!  new-name)  (set! name  new-name))
    (define/public (set-sound! new-sound) (set! sound new-sound))

    ;; Method
    (define/public (speak)
      (printf "~a says ~a!\n" name sound))))


;; ── Subclass: Dog ───────────────────────────────────────────────────
(define dog%
  (class animal%
    (super-new)

    ;; Extra field
    (init-field breed)

    ;; Getter
    (define/public (get-breed) breed)

    ;; Setter
    (define/public (set-breed! new-breed) (set! breed new-breed))

    ;; Overridden method
    (define/override (speak)
      (printf "~a the ~a says ~a!\n"
              (get-name) breed (get-sound)))))


;; ── Main ────────────────────────────────────────────────────────────

; Animal instance
(define a (new animal% [name "Cat"] [sound "Meow"]))
(send a speak)

; Using setters
(send a set-name!  "Kitten")
(send a set-sound! "Purr")
(send a speak)

(newline)

; Dog instance
(define d (new dog% [name "Rex"] [sound "Woof"] [breed "Labrador"]))
(send d speak)

; Using setters
(send d set-name!  "Max")
(send d set-breed! "Poodle")
(send d speak)

(newline)

; Using getters
(printf "Dog name:  ~a\n" (send d get-name))
(printf "Dog breed: ~a\n" (send d get-breed))
(printf "Dog sound: ~a\n" (send d get-sound))