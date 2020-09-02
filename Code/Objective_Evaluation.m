function F=Objective_Evaluation(x,deg,plt,edge,PlotWithoutUncertainty)

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


% F(1)=x(1); % For the case that objectives are the same as axis
% F(2)=x(2);
% % F(3)=x(3); %******************


% %Messac Two bar truss p.369- 2D
% %------x0(1 and 2)=10; without x0 = x at the end of each iteration
% %x0(1 and 2)=0; with x0 = x at the end of each iteration /interesting picture

Fo=15166.6;t=2.66;w=741.6;ro=7.8e-3;E=210000;
m=2*pi*ro*t*x(1)*sqrt(w^2+x(2)^2);
s=Fo/(2*pi*t*x(1)*x(2))*sqrt(w^2+x(2)^2);
d=(Fo*(w^2*x(2)^2)^(3/2))/((2*pi*t*E*x(1)*x(2))^2);
 
F(1)=m;

F(2)=d;


%-------F TILDA Generation-------
if plt==1
    1;
else
    F=F*shrink(deg,edge);%---'shrink' for 2D and 'shrink3d' for 3d 
end

end
