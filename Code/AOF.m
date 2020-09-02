function Aggregate_Objective_Function=AOF(x,degree,plt,edge,uncertainty)


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

F=Objective_Evaluation(x,degree,plt,edge,uncertainty);
Aggregate_Objective_Function=1;%F(1)+F(2);%+F(3); This is usually the sum(F)
end
