#lang racket
#|
1.2.5 Example:Testing for Primality
|#

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond
    [(> (square test-divisor) n) n]
    [(divides? test-divisor n) test-divisor]
    [else (find-divisor n (+ test-divisor 1))]))
(define (divides? a b)
  (= (remainder b a) 0))
(define (square n)
  (* n n))
(define (prime? n)
  (= n (smallest-divisor n)))

#|
Fermat's Little Theorem[费马小定理]:
  if n is a primer number and a is any positive integer less than n, then a raised to the nth power is congruent to a modulo n.
|#

(define (expmod base exp m)
  (cond
    [(= exp 0) 1]
    [(even? exp)
     (remainder (square (expmod base (/ exp 2) m)) m)]
    [else
     (remainder (* base (expmod base (- exp 1) m)) m)]))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(fermat-test 100) ;;#f
(fermat-test 5) ;;#t

(define (fast-prime? n times)
  (cond
    [(= times 0) #t]
    [(fermat-test n) (fast-prime? n (- times 1))]
    [else #f]))
(fast-prime? 100 5) ;#f
(fast-prime? 19999 5) ;#f
(fast-prime? 7 5) ;#t

#|
Exercise 1.22
|#
(define (runtime) (current-milliseconds))
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      #f))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
