#lang racket
#|
Procedures as black-box abstractions
|#

#|
过程抽象[Procedural abstraction]:不关心实现的细节而只关心实现的结果
|#

#|
origin version
|#
(define (square x) (* x x))
(define (sqrt-x x)
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (average x y)
    (/ (+ x y) 2))
  (define (sqrt-iter guess x)
    (if [good-enough? guess x]
        guess
        (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x))

(sqrt-x 16) ;;4.000000636692939

#|
improved version
|#
(define (square x) (* x x))
(define (sqrt-x-ex x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (average a b)
    (/ (+ a b) 2))
  (define (sqrt-iter guess)
    (if [good-enough? guess]
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(sqrt-x-ex 4) ;;2.0000000929222947
