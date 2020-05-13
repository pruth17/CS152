#lang racket

#|
Problem 1: deep-map

This problem is testing your understanding of recursion.
Your solution must be recursive.  Higher order functions
are not allowed.

Description: Write a deep-map function.  This function works
similarly to the built-in map function, except that it applies
the function 'f' to elements contained in nested lists.

The rules are as follows:
1) if item is NOT a list, the function f should be applied to item.
2) if item is a list, deep-map should be applied to all of the elements in the list.
|#


  (define (deep-map f item)
  (cond
     ((number? item)
        (f item))
    ((null? item) '())
    ((not (pair? (car item)))
     (cons (f (car item))
           (deep-map f (cdr item))))
    (else
     (cons (deep-map f (car item))
           (deep-map f (cdr item))))))


(displayln "Testing deep-map: number")
; EXPECTED OUTPUT: 343
(deep-map (λ(x)(* x x x)) 7)

(displayln "Testing deep-map: empty list")
; EXPECTED OUTPUT: '()
(deep-map number->string '())

(displayln "Testing deep-map: flat list")
; EXPECTED OUTPUT: '(2 3 4 5)
(deep-map (λ(x)(+ x 1))
          '(1 2 3 4))

(displayln "Testing deep-map: nested list")
; EXPECTED OUTPUT: '((2 3 4 5) 6 7 8)
(deep-map (λ(x)(+ x 1))
          '((1 2 3 4) 5 6 7))

(displayln "Testing deep-map: deeply nested list")
; EXPECTED OUTPUT: '((((2) (4)) ((6) (8))) (((10) (12)) ((14) (16))))
(deep-map (λ(x)(* x 2))
          '((((1)(2))((3)(4))) (((5)(6))((7)(8)))))