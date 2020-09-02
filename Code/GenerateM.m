function M=GenerateM(m)%,m1)

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



%% ----- Generate M for 2D Cases----------
% anchor_1=[-1;0];
% anchor_2=[0;-1];
% M=m*anchor_2+(1-m)*anchor_1;

% Messac Two bar truss p.369--physical robust
anchor_1=[1873.60; 0.54];
anchor_2=[9717.63; 0.00];
M=m*anchor_2+(1-m)*anchor_1;

%% ----- Generate M for 3D Cases----------
% anchor_1=[1;0;0];
% anchor_2=[0;1;0];
% anchor_3=[0;0;1];
% M=m*anchor_1+m1*anchor_2+(1-m-m1)*anchor_3;


% There are some ways for distributing the points evenly on the utopia
% plane, look at the above paper for illustration
