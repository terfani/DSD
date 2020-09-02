%-----------------------------------------------------------------------%
% This program is the MATLAB code for implementation of the DSD         %
% and DSDII algorithm following the content of the research papers:     %
%                                                                       %
% Tohid Erfani, Sergei, V. Utyuzhnikov, Directed Search Domain: A       %
% Method for Even Generation of Pareto Frontier in Multiobjective       %
% Optimization, Journal of Engineering Optimization, 2010.              %
%                                                                       % 
% Erfani T, Utyuzhnikov SV, Kolo B. A modified directed search domain   % 
% algorithm for multiobjective engineering and design optimization.     %
% Structural and Multidisciplinary Optimization. 2013 - 48(6):1129-41.  %
%                                                                       %
% http://dx.doi.org/10.1080/0305215X.2010.497185                        %
% Copyright (c) 2008-2011 by Tohid Erfani, All right reserved.          %
% t.erfani@ucl.ac.uk                                                    %
%-----------------------------------------------------------------------%

function Anchorpoint()
lb(1)=0;ub(1)=1;
lb(2)=0;ub(2)=1;
x0 = [0;0];
[x,fv] = fmincon(@(x)FM(x),x0,[],[],[],[],lb,ub,@(x)constraint(x));
x
fv
end

function F = FM(x)
% F(1)=x(1);
F(1)=x(2);
end


function [c, ceq] = constraint(x)

c(1) = -x(1)^2 - x(2)^2 + 1;
c(2) = -x(1);
c(3) = -x(2);


ceq = [];
end

    