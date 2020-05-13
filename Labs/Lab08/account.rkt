
#lang racket

(require racket/contract)

(struct account (balance))

(provide new-account balance withdraw deposit account)

;; A new, empty account
(define new-account (account 0))

;; Ensuring that balance is positive
(define/contract (positiveBalance acc)
(account? . -> . boolean?)
(if (> (balance acc) 0) #t
#f))

;; Get the current balance
(define/contract (balance acc)
(account? . -> . number?)
(account-balance acc))

;; Withdraw funds from an account
(define/contract (withdraw acc amt)
(account? (and/c number? positive?) . -> . (and/c account? positiveBalance))
(account (- (account-balance acc) amt)))

;; Add funds to an account
(define/contract (deposit acc amt)
(account? (and/c number? positive?) . -> . (and/c account? positiveBalance))
(account (+ (account-balance acc) amt)))
