function R=CalculateR(l0,l)

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


%--------T=rotation in hyperplane created by l0 and l--ns by ns matrix
ns=2;
T=zeros(ns); %     <---only change ns
T(1,1)=dot(l0,l)-1;
T(1,2)=-sqrt(abs(1-dot(l0,l)));
T(2,1)=sqrt(abs(1-dot(l0,l)));
T(2,2)=dot(l0,l)-1;
I=eye(size(T));
T=I+T;

%-------D=gram-Schmit orthogonalization to find ns basis
D=grams(l0,l);

%-------calculate the R as DTD^(-1)
R=D*T*D^(-1);

