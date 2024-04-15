#!/usr/bin/env guile -s
!#

;; program that finds prime numbers

(use-modules (ice-9 textual-ports) )

(newline)
(display "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~") (newline)
(display " This program finds prime numbers ") (newline)
(display "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~") (newline)
(newline)

(display "Enter max number to search to: ")
(define maxn (get-line (current-input-port) ) )

(if (> (string-length maxn) 0)
        (set! maxn (string->number maxn) )
        (exit)
)

(if (not (number? maxn))
        (exit)
)

(display "2")
(newline)


(define n 3)
(define p 2)
(define sqrtn (inexact->exact (ceiling (sqrt n) ) ) )
(while (<= n maxn)
        (set! p 2)
        (set! sqrtn (inexact->exact (ceiling (sqrt n) ) ) )
        (if     (not    (while (<= p sqrtn)
                                (if (= 0 (modulo n p))
                                        (break #t)
                                )
                                (set! p (+ p 1) )
                        )
                )
                (display (string-append (number->string n) "\n") )
        )
        (set! n (+ n 1) )
)
