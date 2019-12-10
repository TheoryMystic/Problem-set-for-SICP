#lang racket
#|
条件表达式及谓词[Conditional Expressions and Predicates]
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
Exercise 1.1: Below is a sequence of expressions. What is the result printed by the interpreter in response to each expression? Assume that the sequence is to be evaluated in
the order in which it is presented.
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

