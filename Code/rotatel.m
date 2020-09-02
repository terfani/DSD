function l=rotatel(anchor_1,anchor_2,anchor_3,n,edge)

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


v(:,1)=anchor_1-anchor_2;
v(:,2)=anchor_2-anchor_3;
v(:,3)=anchor_3-anchor_1;

if edge==1%YZ--->m2,m3
    v(:,1)=anchor_1-anchor_2;
    v(:,2)=anchor_2-anchor_3;
elseif edge==2%XZ--->m1,m3
    v(:,1)=anchor_2-anchor_3;
    v(:,2)=anchor_3-anchor_1;
elseif edge==3%XY--->m1,m2
    v(:,1)=anchor_3-anchor_1;
    v(:,2)=anchor_1-anchor_2;
end

beta=-dot(v(:,1),v(:,2))/dot(v(:,2),v(:,2));
s=(v(:,1)+beta*v(:,2))/norm(v(:,1)+beta*v(:,2));
A=[v(:,3)';n'];
S=null(A);
% SS=cross(v(:,1),n);
% SS=cross(v(:,2),n);
SS=cross(v(:,2),n);
teta=pi/3;  % <-- amound of rotate from the edge
l=cos(teta)*n-sin(teta)*s;
a=l';
l=[];
l=a;
