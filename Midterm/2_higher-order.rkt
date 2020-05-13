#lang racket

#|
Problem 2: deep-map

This problem is testing your understanding of higher-order functions.
Your solution **cannot** use recursion directly.
Instead, you must use map, filter, and either foldl or foldr.

Description: Take in a list of numbers (lst).  Return a comma-separated
string with all of the positive numbers from the list.
For full points, the order of the numbers must be preserverd,

and you cannot have a trailing comma.
|#

(define (list-of-nums-to-csv-of-positives lst)
  
  (cond [(empty? lst) ""]
        [(= (car lst) 0) ""]
        [else (let ([positive (filter positive? lst)])
         (foldl
          (lambda (a b) (if (eq? b "")
             (number->string a)
               (string-append b ", " (number->string a)))) "" positive))]))



(displayln "Testing hof: empty list") 
; EXPECTED OUTPUT: ""
(list-of-nums-to-csv-of-positives '())

(displayln "Testing hof: positive")
; EXPECTED OUTPUT: "12"
(list-of-nums-to-csv-of-positives '(12))

(displayln "Testing hof: negative")
; EXPECTED OUTPUT: ""
(list-of-nums-to-csv-of-positives '(-12))

(displayln "Testing hof: zero")
; EXPECTED OUTPUT: ""
(list-of-nums-to-csv-of-positives '(0))

(displayln "Testing hof: mixed list 1")
; EXPECTED OUTPUT: "1, 32, 45"
(list-of-nums-to-csv-of-positives '(1 -9 32 -6 45 0))

(displayln "Testing hof: mixed list 2")
; EXPECTED OUTPUT: "8, 4, 15, 99, 0, 16, 32, 12"
(list-of-nums-to-csv-of-positives '(8 4 15 99 0 -1 16 32 12))
