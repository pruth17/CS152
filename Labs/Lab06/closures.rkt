#lang racket

(define (make-adder x)
  (lambda (y) (+ x y)))

(define (make-counter)
  (let ([count 0])
    (lambda ()
     (set! count (+ count 1))
      count)))

(define my-count (make-counter))
(my-count)
(my-count)
(my-count)
(my-count)

