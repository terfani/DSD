# DSD
Implementation of Directed Search Domain (DSD) Multiobjective optimisation algorithm

# Introduction

DSD is a library written in the MATLAB programming language to support the
searching for the Pareto solution in n-dimensional multiobjective optimisation
context. 


# Usgae

To start, there are two inputs which should be provided for the algorithm, (i)
x0, which is the starting point with the same dimension of the deisgn variable
space and (ii) deg, which is the degree of the generating cone; the enough 
smaller degree (e.g. 5 ) will provide a reasonable set of evenly distributed 
Pareto points. Therefore, the designer should start with:

[ParetoX, ParetoF] = Pareto_Generation(x0, deg)

To set the constraints and the objective functions, designer should refer to:
const.m and Objective_Evaluation.m respectively. In addition, to set the 
bounds for each deisgn variables, there is a % Bounds% session provided inside
the Pareto_Generation.m file.

