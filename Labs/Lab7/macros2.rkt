#lang racket

(define-syntax switch (syntax-rules ()
[(switch x (val exp)) exp]
[(switch x [val exp] rest ...)
(if (eqv? x val)
exp
(switch x rest ...))]))

(define x 9)
(switch x
[1 (displayln "x is 1")]
[3 (displayln "x is 3")]
[5 (displayln "x is 5")]
[7 (displayln "x is 7")]
[9 (displayln "x is 9")]
[default (displayln "none of the above")])

(define (is-even? n)
(switch (modulo n 2)
[0 #t]
[1 #f]))
(is-even? 9)
(is-even? 8)

 
