#lang racket
#|
1.1.4 Compound Procedures
|#

#|
数字[Numbers]: 作为基本元素[Primitive data]
运算符[Operations]: 作为运算过程[Procedure]
嵌套组合式[Nesting Combinations]: 作为组合<运算符>的方法
定义[Definitions]: 有限制的抽象手段,为<命名对象>关联对应的<值>
过程定义[Procedure definitions]: 更强大的抽象手段,让复合运算[Compound Operations]作为<命名对象>
|#

#|
<过程定义>的一种普遍形式:
(define (<name> <formal parameters>)
  <body>)
name: 一个在<环境>中与<过程定义>相关的<符号>
formal parameters: 一个参数对象列表,在<body>中使用
body: 将<formal parameters>中的参数替换为实际参数,再进行计算的一个<表达式>
|#

(define (square x)
  (* x x))

(square 21) ;;441

(square (+ 2 5)) ;;49

(square (square 3)) ;;81

(define (sum-of-squares x y)
  (+ (square x)
     (square y)))

(sum-of-squares 3 4) ;;25

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

(f 5) ;;136
