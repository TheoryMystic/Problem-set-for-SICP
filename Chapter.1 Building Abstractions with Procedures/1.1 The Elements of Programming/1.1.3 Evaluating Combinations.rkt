#lang racket/base
#|
组合式求值[Evaluating Combinations]
|#

#|
递归[Recursive]: 指一种通过重复将问题分解为同类的子问题而解决问题的方法

原子式[Primitive Expressions]: 单个的数字,运算符或者其他<命名对象>
组合式[Combinations]: <原子式>的组合
|#

#|
求组合式值的方式[Way of evaluating a combination]:
  1. 计算该组合式所有子表达式的值
  2. 将最左侧表达式(运算符)的值作为运算过程,剩余的其他子表达式(运算对象)的值作为参数,进行运算
|#

