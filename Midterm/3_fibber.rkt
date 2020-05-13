#lang racket
#|
Problem 3: Fibonacci Sequence counter

This problem is testing your understanding of closures.
For this problem only, you ARE allowed to use "set!".
For tips, you might want to review the make-counter function from
http://www.cs.sjsu.edu/~austin/cs152-spring20/labs/lab06/closures.rkt.

Description: The make-fibber function takes no arguments, and returns
a function that also takes no arguments.  We will call this second
function "fib", though the code actually has "fib1" and "fib2".

When the fib function is called, it returns the next number in the
Fibonacci sequence (https://en.wikipedia.org/wiki/Fibonacci_number).
Note that if there are multiple fib functions, each maintains its
own place in the sequence.
|#

(define (make-fibber)
  (let ([a 0] [b 0] [counter 0])
    (λ ()
      (set! counter (+ counter 1))
      (if (= counter 2) (set! a 1) (+ counter 1))
      (if (= counter 3) (set! b 0) (+ counter 1))
      (set! a (+ a b))
      (set! b (- a b))
      a)))

(displayln "Testing fib functions")

;; Expected output for each call listed in the comment
(define fib1 (make-fibber))
(fib1) ; 0
(fib1) ; 1
(fib1) ; 1
(fib1) ; 2
(fib1) ; 3
(fib1) ; 5
(define fib2 (make-fibber))
(fib2) ; 0
(fib1) ; 8
(fib2) ; 1
(fib2) ; 1
(fib2) ; 2
(fib1) ; 13
(fib2) ; 3
(fib2) ; 5
(fib2) ; 8
