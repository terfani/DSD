function [c,ceq]=const(x,P,deg,opposite,edge)%<--edge is for 3D. it is 0 for 2D

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


F=Objective_Evaluation(x,deg,0,edge,0);
 
 
% %%------------- Example---1----------------------------------
% c(1) = x(1)^2 + x(2)^2 - 1;
% c(2) = -1 -x(1);
% c(3) = -1 -x(2);
% if opposite==0
%     c(4) = F(1) - P(1);
%     c(5) = F(2) - P(2);
% else
%     c(4) = -F(1) + P(1);
%     c(5) = -F(2) + P(2);
% end
% % ----------------------------------------------------------------

% %%------------- Example---2----------------------------------
% c(1) = -x(1)^2 - x(2)^2 + 1;
% c(2) = -x(1);
% c(3) = -x(2);
% if opposite==0
%     c(4) = F(1) - P(1);
%     c(5) = F(2) - P(2);
% else
%     c(4) = -F(1) + P(1);
%     c(5) = -F(2) + P(2);
% end
% % ----------------------------------------------------------------


%%------------- Example 3-------
% c(1) = -x(1)^2 - (x(2)/3)^2 + 1;
% c(2) = -x(1)^4 - x(2)^4 + 16;
% c(3) = -(x(1)/3)^3 - x(2)^3 + 1;
% c(4) = x(1)-2.9;
% c(5) = x(2)-2.9;
% c(6) = -x(1);
% c(7) = -x(2);
% if opposite==0
%     c(8) = F(1) - P(1);
%     c(9) = F(2) - P(2);
% else %Opposite direction of search box
%     c(8) = -F(1) + P(1);
%     c(9) = -F(2) + P(2);
% end




%%----------Sphere--------------------
% c(1) = -x(1)^2 - x(2)^2 - x(3)^2 + 1;
% c(2) = -x(1);
% c(3) = -x(2);
% c(4) = -x(3);
% if opposite==0
%     c(5) = F(1) - P(1);
%     c(6) = F(2) - P(2);
%     c(7) = F(3) - P(3);
% else
%     c(5) = -F(1) + P(1);
%     c(6) = -F(2) + P(2);
%     c(7) = -F(3) + P(3);
% end
 

% Messac Two bar truss p.369-2D
Fo=15166.6;t=2.66;w=741.6;ro=7.8e-3;E=210000;
sigma=(1/8)*pi^2*E*(t^2+x(1)^2)/(w^2+x(2)^2);
s=Fo/(2*pi*t*x(1)*x(2))*sqrt(w^2+x(2)^2);
c(1)=s-sigma;
if opposite==0
    c(2) = F(1) - P(1);
    c(3) = F(2) - P(2);
else
    c(2) = -F(1) + P(1);
    c(3) = -F(2) + P(2);
end

%%
ceq=[];

end
