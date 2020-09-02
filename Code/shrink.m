function B=shrink(degree,edge)

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



GammaN=deg2rad(45);
GammaC=deg2rad(degree);
GammaPlus=GammaN+GammaC;
GammaMinus=GammaN-GammaC;


%The normal vector; however, there are methods which can be subsituted 
%e.g. determinant in different dimensions for generalisation
anchor_1=GenerateM(0);
anchor_2=GenerateM(1);
Hyperplane_Vector=anchor_1-anchor_2;
system=[Hyperplane_Vector, zeros(size(Hyperplane_Vector))];
Normal=null(system');


% ---General case
E=eye(2); %ns=2
l=Normal';% l=normal line
l0=[1/sqrt(2) 1/sqrt(2)];

R=CalculateR(l0,l);
for i=1:2 %ns=2
    E(:,i)=l(i);
end
A=sin(GammaC)/sin(GammaN)*R'+sin(GammaMinus)/sin(GammaN)*E;
B=A^(-1);
B=B/norm(B);


end
