function [ParetoX, ParetoF, time, UtopiaPoints] = Pareto_Generation(x0, deg)

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


% if isrow(x0)
%     x0=x0';
% end

format bank;
k=1;

%-------------------------------------
% Bounds for example 2 of the paper
% lb(1)=-1;ub(1)=0;
% lb(2)=-1;ub(2)=0;

% Two bar truss
lb(1)=1;ub(1)=100;
lb(2)=10;ub(2)=1000;

%-------------------------------------

 
%Running time
tic
options = optimset('display','iter','Algorithm','active-set');
hold all
xlabel('\fontname{courier} \bf f_1','FontSize',13)
ylabel('\fontname{courier} \bf f_2','FontSize',13)
zlabel('\fontname{courier} \bf f_3','FontSize',13)

s1=0;s2=0;
p = 50; 
for m = 0:1/(p-1):1
    M = GenerateM(m); % M in F space
    scatter(M(1),M(2),'+b');
    UtopiaPoints(:,k) = M;

    %Shrink the M
    M_not_shrink=M;
    M = M'*shrink(deg);
    P = M';

    disp('')
    disp('***************************************************************************')
    m    
    [x,fv,exitflag,iteration] = fmincon(@(x)AOF(x,deg,0,0,0),x0,[],[],[],[],lb,ub,...
        @(x)const(x,P,deg,0,0),options);
    s1(k)=iteration.iterations;       
    
    if exitflag ~= 1 && exitflag ~= 4 && exitflag ~= 5 
        disp('------------------------------------------')
        disp('*****Direction of search is transited*****')
        disp('------------------------------------------')
        [x,fv,exitflag,iteration]= fmincon(@(x)AOF(x,deg,0,0,0),x0,[],[],[],[],lb,ub,...
            @(x)const(x,P,deg,1,0),options);    
        s2(k)=iteration.iterations;                   
        
   else

   end
    ParetoX(:,k) = x(:,1);
    ParetoF(:,k) = Objective_Evaluation(ParetoX(:,k),45,1,0,1);
    k = k+1;
%     x0 = x; %----not good for some cases, also in some cases is useful when x0 is random in first
    sum(s1)/k;
    sum(s2)/k;
end
time=toc;
axis equal
axis square
plot(ParetoF(1,:),ParetoF(2,:),'or')

