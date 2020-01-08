#lang racket/base
#|
1.1.2 Naming and the Enviroment
|#

#|
值[Value]: 占用了存储空间的数字或者字符对象
变量[Variable]: 储存了<值>的<对象>
命名对象[Name]: 指明了一个<变量>的值是一个对象
环境[Environment]: 存储了<命名对象>的空间
|#

(define size 2)
(* size 2) ;;4

(define pi 3.1415926)
(define radius 10)

(* pi (* radius radius)) ;; 314.15926

(define circumference (* 2 pi radius))
circumference ;;62.831852

