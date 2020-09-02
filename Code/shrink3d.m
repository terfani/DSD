function B=shrink3d(degree,edge)

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


anchor_1=GenerateM(1,0);
anchor_2=GenerateM(0,1);
anchor_3=GenerateM(0,0);
P1=anchor_1-anchor_2;
P2=anchor_1-anchor_3;

%The normal vector; however, there are methods which can be subsituted 
%e.g. determinant in different dimensions for generalisation
Normal = cross(P1, P2);


% ---General case
E=eye(3); %ns=3

if edge ~= 0
    l=rotatel(anchor_1,anchor_2,anchor_3,Normal/norm(Normal),edge);
else
    l=Normal/norm(Normal);
    reserve=l;
    l=[];
    l=reserve';
end

% l=Normal'/norm(Normal');% l=normal line
l0=[1/sqrt(3) 1/sqrt(3) 1/sqrt(3)];
% l=l0;
R=CalculateR(l0,l);
for i=1:3 %ns=3
    E(:,i)=l(i);
end
A=sin(GammaC)/sin(GammaN)*R'+sin(GammaMinus)/sin(GammaN)*E;
B=A^(-1);
B=B/norm(B);

end
