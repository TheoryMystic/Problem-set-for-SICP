#lang racket
#|
Example - Square Root by Newton's Method
|#

#|
procedures VS mathematical functions
describe properties of things VS describe how to do things
declarative knowledge VS imperative knowledge
|#

#|
root = the number you want to square
guess(initial) = guess number you select
quotient = root / guess(iteration)
average(next) = (guess(initial) + quotient) / guess(initial)
guess(iteration) = average(prev)
|#

#|
sqrt-newton book version
|#
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

#|
sqrt-newton my version
|#
(define (sqrt-mine root)
  (guess-newton root 1.0 0.0 0.0001))

(define (guess-newton root guess guess-prev tolerance)
  (if
   (< (abs(- guess-prev guess)) tolerance) guess
   (guess-newton root (guess-iter root guess) guess tolerance)))

(define (guess-iter root guess)
  (guess-average guess (guess-quotient root guess)))

(define (guess-quotient root guess)
  (/ root guess))

(define (guess-average raw quot)
  (/ (+ raw quot) 2.0))

(sqrt-mine 2) ;;1.4142135623746899
(sqrt-mine 3) ;;1.7320508100147274
(sqrt-mine 4) ;;2.000000000000002
(sqrt-mine 144) ;;12.0

#|
Exercise 1.6:
 Alyssa P. Hacker doesn’t see why if needs to be provided as a special form. “Why can’t I just define it as an ordinary procedure in terms of cond?” she asks. Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:
|#
(define (good-enough-test? guess x)
  (cond ((< (abs (- (square guess) x)) 0.001) #t)
        (else #f)))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (new-if-test predicate then-clause else-clause)
  (if predicate then-clause else-clause))

(define (cond-test predicate then-clause else-clause)
  (cond [predicate? then-clause]
        [else else-clause]))

(define (sqrt-iter-test guess x)
  (new-if (good-enough-test? guess x)
               guess
               (sqrt-iter-test (improve guess x) x)))
(sqrt-iter-test 1.0 3.0) ;;infinite loop

(define (sqrt-iter-iftest guess x)
  (new-if-test (good-enough? guess x)
               guess
               (sqrt-iter-iftest (improve guess x) x)))
(sqrt-iter-iftest 1.0 3.0) ;;infinite loop

(define (sqrt-iter-condtest guess x)
  (cond-test (good-enough-test? guess x)
               guess
               (sqrt-iter-condtest (improve guess x) x)))
(sqrt-iter-condtest 1.0 3.0) ;;infinite loop

(define (sqrt-iter-cond-ver guess x)
  (cond ((good-enough? guess x) guess)
        (else (sqrt-iter-cond-ver (improve guess x) x))))
(sqrt-iter-cond-ver 1.0 3.0) ;;1.7321428571428572

(if #t (display "good") (display "bad")) ;;good
(new-if #t (display "good") (display "bad")) ;;goodbad

(if #t 'good 'bad) ;;'good
(new-if #t 'good 'bad) ;;'good

#|
原因:
 1. if是一种特殊形式,当它的predicate为真时,then-clause分支会被<求值>,否则,else-clause分支被求值,两个clause只有一个会被求值.
 2. new-if 遵循<应用序>求值规则,每个参数的实参在传入时都会被求值,所以无论predicate真假,then-clause和else-clause两个分支都会被求值.
The Reason Why:
(if test-expr then-expr else-expr)
 Evaluates test-expr. If it produces any value other than #f, then then-expr is <evaluated>, and its results are the result for the if form. Otherwise, else-expr is <evaluated>, and its results are the result for the if form. The then-expr and else-expr are in tail position with respect to the if form.
|#

#|
Exercise 1.7:
 The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. this makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?
|#

;; see above sqrt-newton my version :)

#|
Exercise 1.8:
 Newton’s method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value
 (/ (+
      (/ x
          (* y y))
      (* 2 y))
    3)
 Use this formula to implement a cube-root procedure analogous to the square-root procedure.
|#
(define (cubic-root-mine root)
  (guess-cubic root 1.0 0.0 0.001))
(define (guess-cubic root guess guess-prev tolerance)
  (cond [(< (abs (- guess guess-prev)) tolerance) guess]
        [else (guess-cubic root (guess-cubic-iter root guess) guess tolerance)]))
(define (guess-cubic-iter x y)
  (/ (+
      (/ x
         (* y y))
      (* 2.0 y))
     3.0))
(cubic-root-mine 125) ;;5.000000000287929
(cubic-root-mine 8) ;;2.000000000012062
(cubic-root-mine 27.1) ;;3.00369914061532
