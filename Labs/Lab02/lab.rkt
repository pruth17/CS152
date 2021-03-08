#lang racket

(provide reverse add-two-lists positive-nums-only)

(define (reverse lst)
  (cond 
   [(empty? lst) lst]
   [else (append (reverse (cdr lst)) (list (car lst)))]
   
   )
  
  )

(define (add-two-lists lst1 lst2)
  (define (zeros lst n)
  (append lst (make-list (abs n) 0)))
 
  (let ((difference (- (length lst1) (length lst2))))
    (cond [(< difference 0)
           (map + (zeros lst1 difference) lst2)]
          [(> difference 0)
           (map + lst1 (zeros lst2 difference))]
          [else (map + lst1 lst2)]))
  
  )

(define (positive-nums-only lst)
  (cond
    [(empty? lst) lst]
    [(negative?  (car lst)) (positive-nums-only (cdr lst))]
    [else positive-nums-only lst]
    
    ) )