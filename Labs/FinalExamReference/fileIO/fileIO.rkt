; ── RACKET ──────────────────────────────────────────────────────────

; ── Basic Read ───────────────────────────────────────────────────────

; Read whole file as string
(define content (file->string "input.txt"))
(display content)

; Read as list of lines
(define lines (file->lines "input.txt"))
(for-each displayln lines)

; Read line by line manually
(define port (open-input-file "input.txt"))
(let loop ([line (read-line port)])
  (unless (eof-object? line)                ; eof check
    (displayln line)
    (loop (read-line port))))
(close-input-port port)

; Safest way - auto closes port on exit or error
(call-with-input-file "input.txt"
  (lambda (port)
    (let loop ([line (read-line port)])
      (unless (eof-object? line)
        (displayln line)
        (loop (read-line port))))))

; ── Basic Write ──────────────────────────────────────────────────────

; Write to file (overwrites)
(define out (open-output-file "output.txt" #:exists 'replace))
(display "Hello World\n" out)
(close-output-port out)

; Append to file
(define out (open-output-file "output.txt" #:exists 'append))
(display "Another line\n" out)
(close-output-port out)

; Safest way - auto closes port
(call-with-output-file "output.txt" #:exists 'replace
  (lambda (port)
    (display "Hello World\n" port)))

; ── Read, Process, Write ─────────────────────────────────────────────
(define lines (file->lines "students.txt"))

(call-with-output-file "results.txt" #:exists 'replace
  (lambda (out)
    (for-each
      (lambda (line)
        (unless (string=? (string-trim line) "")      ; skip empty lines
          (define parts (string-split line ","))
          (define name  (string-trim (first parts)))
          (define score (string->number (string-trim (second parts))))
          (define grade (if (>= score 50) "PASS" "FAIL"))
          (fprintf out "~a | ~a\n" name grade)))
      lines)))