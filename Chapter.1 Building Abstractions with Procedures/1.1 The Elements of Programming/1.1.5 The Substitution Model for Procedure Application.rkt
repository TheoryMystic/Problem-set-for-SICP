#lang racket
#|
过程应用的替换模型[The Substitution Model for Procedure Application]
|#

#|
应用处置[Application Process]:为了将<复合过程>应用到<参数列表>,需要将<body>中的<参数列表>替换为对应的实际参数,再对这一<过程运算>进行<求值>
|#
