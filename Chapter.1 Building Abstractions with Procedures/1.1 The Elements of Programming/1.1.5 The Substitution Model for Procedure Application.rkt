#lang racket
#|
过程应用的替换模型[The Substitution Model for Procedure Application]
|#

#|
应用处置[Application Process]:为了将<复合过程>应用到<参数列表>,需要将<body>中的<参数列表>替换为对应的实际参数,再对这一<过程运算>进行<求值>
|#

#|
应用序[Applicative order]: 先求值参数然后应用[evaluate the arguments and then apply]
1. 同时展开运算符及其运算对象[evaluates the operator and operands]
2. 对展开的运算符及其运算对象进行求值[apply the resulting procedure to the resulting arguments]

正则序[Normal order]: 完全展开再规约[fully expand and then reduce]
1. 一直展开直到运算符已经是基本运算符[substitute operand expressions for parameters until it obtained an expression involving only primitive operators]
2. 求值[perform the evaluation]
|#
