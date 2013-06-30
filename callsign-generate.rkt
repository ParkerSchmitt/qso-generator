#lang racket

; Return a list containing only the digits in the supplied list, maintaining
; order.
(define (digits-from s)
  (filter digit? s))

; Evaluate to true iff the supplied character is a digit.
; If a character is not supplied, evaluate to false.
(define (digit? c)
  (cond ((char? c) (and (char>=? c #\0) (char<=? c #\9)))
        (#t #f)))

(provide digits-from
         digit?)