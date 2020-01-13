#lang racket
#|
1.2.4 Exponentiation
|#

#|
expt recursive
|#
;; step -> O(n)
;; space -> O(n)
(define (expt b n)
  (if [= n 0]
      1
      [* b (expt b (- n 1))]))
(expt 2 3) ;; 8


#|
expt iter - my version
|#
;; step -> O(n)
;; space -> O(1)
(define (expt-my-ver b n)
  (expt-iter b n b))
(define (expt-iter b n it)
  (cond
        [(= n 0) 1]
        [(= n 1) b]
        [(expt-iter (* b it) (- n 1) it)]))
(expt-my-ver 2 3) ;;8
(expt-my-ver 10 0) ;;1

#|
expt fast-iter
|#
;; step -> O(logn)

(define (fast-expt b n)
  (cond
    [(= n 0) 1]
    [(even? n) (square (fast-expt b (/ n 2)))]
    [else (* b (fast-expt b (- n 1)))]))
(define (even? n)
  (= (remainder n 2) 0))
(define (square n)
  (* n n))

(fast-expt 2 10) ;;1024

#|
Exercise 1.16
|#
(define (expt-log-my-ver b n)
  (expt-iter b n b))
(define (expt-log-iter b n it)
  (cond
    [(= n 0) 1]
    [(= n 1) b]
    [(even? b) (square (expt-log-iter b (/ n 2) it))]
    [(expt-log-iter (* b it) (- n 1) it)]))
(expt-log-my-ver 2 3) ;;8
(expt-log-my-ver 10 0) ;;1
(expt-log-my-ver 2 10)

#|
Exercise 1.17
Perform integer multiplication by means of repeated addition.
|#

;;step -> b
(define (* a b)
  (if [= b 0]
      0
      [+ a (* a (- b 1))]))

;;step -> log(n)
(define (multiply-my-ver a n)
  (fast-multiply-iter a n a))
(define (fast-multiply-iter a n b)
  (cond
    [(= n 1) a]
    [(even? n) (fast-multiply-iter (double a) (halve n) (double a))]
    [(+ b (fast-multiply-iter a (- n 1) b))]))
(define (double n)
  (+ n n))
(define (halve n)
  (cond
    [(even? n) (/ n 2)]))

(multiply-my-ver 2 5) ;;10
(multiply-my-ver 15 5) ;;75
(multiply-my-ver 1 6) ;;6
(multiply-my-ver 10 50) ;;500
(multiply-my-ver 1 50) ;;50
(multiply-my-ver 50 50) ;;2500
