#lang racket
#|
1.1.6 Conditional Expressions and Predicates
|#

#|
谓词[Predicate]: 一个返回真或者假的<过程>或者<表达式>
|#

#|
(cond
  (<p1> <e1>)
  (<p2> <e2>)
  ...
  (<pn> <en>)
  )

<p>: 是一个表达式,返回一个true或者false的结果
|#

;;switch statement
(define (abs x)
  (cond
    ((> x 0) x)
    ((= x 0) 0)
    ((< x 0) (- x))
    ))

;;if statement
(define (abs x)
  (cond
    ((< x 0) (- x))
    (else x)))

#|
if <predicate> <consequent>
   <alternative>
|#
(define (abs x)
  (if (< x 0) (- x)
      x))

#|
复合谓词[Compound predicates]
(and <e1> ... <en>)
(or <e1> ... <en>)
(not <e>)
|#
(and true false true) ;;#f
(or true false false) ;;#t
(not true) ;;#f
(define (>= x y) (not (< x y)))
(>= 5 2) ;;#t
(>= 2 16) ;;#f

#|
Exercise 1.1:
 Below is a sequence of expressions. What is the result printed by the interpreter in response to each expression? Assume that the sequence is to be evaluated in the order in which it is presented.
|#
10 ;;√

(+ 5 3 4) ;;√

(- 9 1) ;;√

(/ 6 2) ;;√

(+ (* 2 4) (- 4 6)) ;;√

(define a 3) ;;×

(define b (+ a 1)) ;;×

(+ a b (* a b)) ;;√

(= a b) ;;√

(if (and (> b a) (< b (* a b)))
    b
    a) ;;√

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25)) ;;√

(+ 2 (if (> b a)
         b
         a)) ;;√

(* (cond
     ((> a b) a)
     ((< a b) b)
     (else -1))
   (+ a 1)) ;;√

#|
Exercise 1.2:
 Translate the following expression into prefix form
|#

(/ (+ 5 4 (- 2 (- 3 (+ 6 4/5))))
   (* 3 (- 6 2) (- 2 7))) ;;-37/150

#|
Exercise 1.3:
 Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.
|#
(define (maximum-of-two v1 v2)
  (if (> v1 v2)
      v1
      v2))
(maximum-of-two 2 5) ;;5

(define (maximum-of-three v1 v2 v3)
  (if (> v1 v2)
      (maximum-of-two v1 v3)
      (maximum-of-two v2 v3)))

(maximum-of-three 15 2 33) ;;33
(maximum-of-three 15 -11 0) ;;15
(maximum-of-three 0 0.33 -0.01) ;;0.33

#|
Exercise 1.4:
 Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:
|#
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;;key point is operators (e.g + -) as data to process

#|
Exercise 1.5:
 Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative order evaluation or normal-order evaluation. He defines the following two procedures:
|#
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))
(test 0 (p))

#|
applicative order: loop forver
-> passed arguments evaluate immediately

normal order: return 0
-> substitute operand expressions for parameters until it obtained an expression involving only primitive operators
|#
