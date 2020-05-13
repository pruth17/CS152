#lang racket

#|
Problem 5: Employee.

This problem is testing your understanding of contracts and structs.

Description: In this file, add contracts for the total-salaries,
add-employee, and adjust-salary functions.  Each function has comments
explaining its requirements.

You may use either define/contract or contract-out as you prefer.

Pay close attention to "blaming" in contract violations.
If you don't see "blaming", your contract is not catching
the error, but it is being caught elsewhere in the system.
(You don't get points for other code catching the errors).

You may use -> for total-salaries and add-employee,
but you will need to use ->i for adjust-salary.

Run 5_test1.rkt to test your contract for total-salaries.
Run 5_test2.rkt to test your contract for add-employee.
Run 5_test3.rkt to test your contract for adjust-salary.
|#

;; You do not need to provide a contract for these functions
(provide employee employee-salary)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; YOUR CODE HERE
;; Use contract-out with provide, or change the functions
;; to use define/contract.

(provide total-salaries add-employee adjust-salary)
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (any x) #t)

(struct employee (id fname lname position salary subordinates))

;; Input:
;;    emps -- List of employees.
;; Output: Positive number.
(define/contract (total-salaries emps)
  (-> list? positive?)
  (foldl (λ(emp salaries) (+ salaries (employee-salary emp))) 0 emps))

;; Input:
;;    emps -- List of employees.
;;    new-emp -- An employee.
;; Output -- List of employees.
(define/contract (add-employee emps new-emp)
  (-> list? employee? list?)
  (cons new-emp emps))

;; Input:
;;    emps -- List of employees.
;;    emp-id -- ID of employee, actually contained in emps.
;;    emp-new-sal -- Positive number.
;; Output: List of employees
(define/contract (adjust-salary emps emp-id emp-new-sal)
  (-> list? (and/c number?  positive?)
       (and/c  number? positive?) list?)
  (let* ([find-emp (λ(emp) (= (employee-id emp) emp-id))]
         [emp (car (filter find-emp emps))]
         [new-emp (employee emp-id
                            (employee-fname emp)
                            (employee-lname emp)
                            (employee-position emp)
                            emp-new-sal
                            (employee-subordinates emp))]
         [other-emps (filter (not/c find-emp) emps)])
    (cons new-emp other-emps)))
 
 