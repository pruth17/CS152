#lang racket

#|
Problem 4: for/each macro

This problem is testing your understanding of macros.

Description: Write a for/each macro.  It should work in a similar
manner to the for-each loop in Java.  You specify a variable,
which will bound to each element of a list (the second argument)
in the specified body.
|#
(define-syntax for/each
  (syntax-rules ()
    (( for/each x ) (void))
    (( for/each x ) (val)
    (let ((x val)) for/each rest ...))))






(displayln "Testing for/each: adding up list of numbers")
(let ([sum 0])
  (for/each x '(1 2 3 4 5)
    (set! sum (+ sum x))) ;; Do as I say, not as I do.
  (displayln sum)) ;; Prints 15

(displayln "Testing for/each: nested for/each loops")
;; Prints "a1 a2 a3 b1 b2 b3 c1 c2 c3 "
(for/each letter '("a" "b" "c")
  (for/each num '(1 2 3)
    (display
     (string-append letter
                    (number->string num)
                    " "))))
