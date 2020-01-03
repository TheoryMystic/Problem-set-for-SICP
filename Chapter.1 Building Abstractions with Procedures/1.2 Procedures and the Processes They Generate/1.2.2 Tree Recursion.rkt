#lang racket
#|
Tree Recursion
|#
(define (fib-recursion n)
  (cond [(= n 0) 0]
        [(= n 1) 1]
        [else (+ (fib-recursion (- n 1))
                 (fib-recursion (- n 2)))]))
(fib-recursion 1) ;;1
(fib-recursion 2) ;;1
(fib-recursion 3) ;;2
(fib-recursion 4) ;;3
(fib-recursion 5) ;;5
(fib-recursion 6) ;;8
(fib-recursion 7) ;;13

(define (fib-iteration n)
  (fib-iter 1 0 n))
(define (fib-iter prev pre-prev cnt)
  (cond
    [(= cnt 0) pre-prev]
    [else (fib-iter (+ prev pre-prev) prev (- cnt 1))]))
(fib-iteration 1) ;;1
(fib-iteration 2) ;;1
(fib-iteration 3) ;;2
(fib-iteration 4) ;;3
(fib-iteration 5) ;;5
(fib-iteration 6) ;;8
(fib-iteration 7) ;;13

#|
Example : Counting Change (origin-version)
total : 1
half-dollars : 0.5
quarters : 0.25
dimes : 0.1
nickels : 0.05
pennies : 0.01
|#

#|
Step 1 : Counting Change (similar problem) -> Step problem
total : 20
each step : 1 or 2
|#
(define (step-problem count)
  (step-count count 1 2))
(define (step-count count step-1 step-2)
  (cond [(< count 0) 0]
        [(= count 0) 1]
        [else (+ (step-count (- count step-1) step-1 step-2)
                 (step-count (- count step-2) step-1 step-2))]))
(step-problem 1) ;;1
(step-problem 2) ;;2
(step-problem 3) ;;3
(step-problem 4) ;;5
(step-problem 5) ;;8
(step-problem 6) ;;13
(step-problem 10) ;;89
(step-problem 20) ;;10946

#|
Step 2 : Counting Change (simplified version)
total : 20
n1 : 10
n2 : 5
n3 : 1
|#
(define (calc-remainder cnt div)
  (cond
    [(= (remainder cnt div) 0) 1]
    [else 0]))
(define (count-change-simp amount)
  (with-ctype amount 3))
(define (count-type n)
  (cond
    [(= n 3) 10]
    [(= n 2) 5]
    [(= n 1) 1]))
(define (with-ctype amount c-type)
  (cond
    [(< amount 0) 0]
    [(= c-type 1) (calc-remainder amount (count-type c-type))]
    [(> amount (count-type c-type))
     (+ (with-ctype (- amount (count-type c-type)) c-type)
        (without-ctype amount (- c-type 1)))]
    [else
     (+ (with-ctype (- amount (count-type c-type)) (- c-type 1))
        (without-ctype amount (- c-type 1)))]
    ))

;; of course without-ctype can be simplified :)
(define (without-ctype amount next-ctype)
  (with-ctype amount next-ctype))

(count-change-simp 1) ;;1
(count-change-simp 5) ;;2
(count-change-simp 10) ;;4
(count-change-simp 15) ;;6
(count-change-simp 17) ;;6

#|
Step final : Counting Change (my version)
total : 100
half-dollars : 50
quarters : 25
dimes : 10
nickels : 5
pennies : 1
|#

(define (calc-remainder cnt div)
  (cond
    [(= (remainder cnt div) 0) 1]
    [else 0]))
(define (count-change-my-version amount)
  (with-ctype amount 5))
(define (count-type n)
  (cond
    [(= n 5) 50]
    [(= n 4) 25]
    [(= n 3) 10]
    [(= n 2) 5]
    [(= n 1) 1]))
(define (with-ctype amount c-type)
  (cond
    [(< amount 0) 0]
    [(= c-type 1) (calc-remainder amount (count-type c-type))]
    [(> amount (count-type c-type))
     (+ (with-ctype (- amount (count-type c-type)) c-type)
        (with-ctype amount (- c-type 1)))]
    [else
     (+ (with-ctype (- amount (count-type c-type)) (- c-type 1))
        (with-ctype amount (- c-type 1)))]
    ))
(count-change-my-version 100) ;;292
(count-change-my-version 200) ;;2435
