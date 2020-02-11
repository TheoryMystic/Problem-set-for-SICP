#lang racket
#|
1.2.4 Greatest Common Divisors
|#

#|
GCD
|#

(define (gcd m n)
  (cond
    [(= n 0) m]
    [else (gcd n (remainder m n))]))
(gcd 10 5) ;;5
(gcd 10 2) ;;2
(gcd 37 19) ;;1

#|
Exercise 1.20
gcd : Normal Order vs Applicative Order
|#

#|
Normal Order:
1. (gcd 206 40)
2. (gcd 40 (remainder 206 40))
3. (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
......
n-2. (remainder (remainder 206 40))
n-1. (remainder 6 4)
n. 2
|#

#|
Applicative Order:
1. (gcd 206 40)
2. (gcd 40 6)
3. (gcd 6 4)
4. (gcd 4 2)
5. (gcd 2 0)
6. 2
|#
