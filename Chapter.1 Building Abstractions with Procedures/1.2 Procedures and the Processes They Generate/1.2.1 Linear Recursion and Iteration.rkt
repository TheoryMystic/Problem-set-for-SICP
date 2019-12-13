#lang racket
#|
Linear Recursion and Iteration
|#

#|
 A procedure is a pattern for the local evolution of a computational process.
|#

#|
延迟操作[Deferred operations]:
线性递归过程[Linear recursive process]:
线性迭代过程[Linear iteractive process]: 值的状态改变,空间大小不变
|#

#|
factorial-recursion
|#
(define (factorial-recursion n)
  (if (= n 1)
      1
      (* n (factorial-recursion (- n 1)))))

(factorial-recursion 5) ;;120

#|
factorial-iteration
|#
(define (factorial-iteration n)
  (factorial-iter 1 n))
(define (factorial-iter product counter)
  (cond [(= counter 1) product]
        [else (factorial-iter (* product counter) (- counter 1))]))
(factorial-iteration 5) ;;120

#|
factorial-iteration-evo
|#
(define (factorial-iteration-evo n)
  (define (factorial-iter product counter)
      (cond [(= counter 1) product]
            [else (factorial-iter (* product counter) (- counter 1))]))
  (factorial-iter 1 n))
(factorial-iteration-evo 5) ;;120

#|
Exercise 1.09:
Each of the following two procedures defines a method for adding two positive integers in terms of the procedures inc, which increments its argument by 1, and dec, which decrements its argument by 1.
|#
(define (inc a)
  (+ a 1))
(define (dec a)
  (- a 1))

(inc 5) ;;6
(dec 10) ;;9

(define (+rec a b)
  (if [= a 0]
      b
      (inc (+rec (dec a) b)))) ;;recursive
#| substitution model
1. (+rec 1 2)
2. (inc (+rec (0) 2))
3. (inc (2))
4. 3
|#

(define (+iter a b)
  (if [= a 0]
      b
      (+iter (dec a) (inc b)))) ;;iteractive
#| substitution model
1. (+iter 1 2)
2. (+iter 0 3)
3. 3
|#


#|
Exercise 1.10:
 The following procedure computes a mathematical function called Ackermann’s function.
|#
(define (A x y)
  (cond [(= y 0) 0]
        [(= x 0) (* 2 y)]
        [(= y 1) 2]
        [else (A (- x 1) (A x (- y 1)))]))

;; What are the values of the following expressions?
(A 1 10) ;;1024
(A 2 4) ;;65536
(A 3 3) ;;65536
(A 4 2) ;;4

;; Consider the following procedures, where A is the procedure defined above:
;;(define (f n) (A 0 n))
;;(define (g n) (A 1 n))
;;(define (h n) (A 2 n))
;;(define (k n) (* 5 n n))

;; Give concise mathematical definitions for the functions computed by the procedures f,g,and h for <positive interger values> of n.

#|(define (f n) (A 0 n))
1. (A 0 n)
2. 2n
|#
(define (f n) (A 0 n))
(f 3) ;; 6

#|(define (g n) (A 1 n))
1. (A 1 n)
2. (A 0 (A 1 (- n 1)))
3. (* 2 (A 1 (- n 1)))
4. (* 2 (A 0 (A 1 (- (- n 1)))))
5. ...
6. 2^n
|#
(define (g n) (A 1 n))
(g 3) ;;8
(g 5) ;;32

(define (A x y)
  (cond [(= y 0) 0]
        [(= x 0) (* 2 y)]
        [(= y 1) 2]
        [else (A (- x 1) (A x (- y 1)))]))

#|(define (h n) (A 2 n))
1. (A 2 n)
2. (A 1 (A 2 (- n 1)))
3. (A 1 (A 1 (A 1 (- (- n 1) 1))))
4. ...
5. ((2^2)^2)^2....
6. (square of (square of (square of ...))) ... (= square-occurrence-time n)
|#

#|(h 3)
1. (A 2 3)
2. (A 1 (A 1 2))
3. (A 1 (A 0 (A 1 1)))
4. (A 1 (A 0 2))
5. (A 1 (* 2 2))
6. (A 1 4)
7. (A 0 (A 1 3))
8. (A 0 (A 0 (A 1 2)))
9. (A 0 (A 0 (A 0 (A 1 1)))
10. (A 0 (A 0 (A 0 2))
11. (A 0 (A 0 (* 2 2))
12. (A 0 (* 2 4))
13. (* 2 8)
14. 16
|#

(define (h n) (A 2 n))
(h 2) ;;4
(h 3) ;;16
(h 4) ;;65536
