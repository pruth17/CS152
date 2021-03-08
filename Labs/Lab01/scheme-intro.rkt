#lang racket
(provide max-num fizzbuzz)

(define (max-num lst)
  0 ;; YOUR CODE HERE -- call `error` on an empty list
 
   (cond
    [(empty? lst) "Empty List"]
    [(empty? (cdr lst)) (car lst)]
    [else 
       (if (< (car lst) (max-num (cdr lst)))  
             (max-num (cdr lst)) 
             (car lst)
         )]
    
)
  )
  


;; The function counts from 1 to the specified number, printing a string with the result.
;; The rules are:
;;    If a number is divisible by 3 and by 5, instead say "fizzbuzz"
;;    Else if a number is divisible by 3, instead say "fizz"
;;    Else if a number is divisible by 5, instead say "buzz"
;;    Otherwise say the number
;;
(define (fizzbuzz n)
  (if (<= n 0)
      (error "n should be positive")
      (fizzbuzz1 1 n))
  ;;"" ;; YOUR CODE HERE
  )
  (define (fizzbuzz1 i n)
(string-append
 (cond [(= 0 (remainder i 15))
           "fizzbuzz"]
        [(= 0 (remainder i 5))
            "buzz"]
        [(= 0 (remainder i 3))
         "fizz"]
        [else (number->string i)])
 " "
 (if (= i n)
    ""
    (fizzbuzz1 (+ i 1) n))))
