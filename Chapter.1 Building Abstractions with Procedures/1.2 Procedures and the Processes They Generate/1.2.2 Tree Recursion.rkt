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
