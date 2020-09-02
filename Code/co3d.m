function [ParetoX, ParetoF, time]=co3d(x0, deg)

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

format bank;
k=1;

% %-------------------------------------
% % Bounds
lb(1)=0.125;ub(1)=5;
lb(2)=0.1;ub(2)=10;
lb(3)=0.1;ub(3)=10;
lb(4)=0.125;ub(4)=5;
% %-------------------------------------

tic
options = optimset('display','iter','Algorithm','active-set');
hold all
xlabel('\fontname{courier} \bf f_1','FontSize',13)
ylabel('\fontname{courier} \bf f_2','FontSize',13)
zlabel('\fontname{courier} \bf f_3','FontSize',13)
p = 10; 
s=0;
for m = 0:1/(p-1):1
    for m1=0:1/(p-1):1-m
        M = GenerateM(m,m1); % M in F space
        scatter3(M(1),M(2),M(3),'+b');
        %if M(1)== 0 || M(2)== 0 ||M(3)== 0 
        if m == 0 || m1 == 0 || (1-m-m1) == 0 
            edge=0;  %<- edge=1 means the point is on the edge
        else
            edge=0;            
        end
        M = M'*shrink3d(deg,edge);
        P = M';    
        disp('')
        disp('***************************************************************************')
        m
        m1
        [x,fv,exitflag,iteration] = fmincon(@(x)AOF(x,deg,0,edge,0),x0,[],[],[],[],lb,ub,...
            @(x)const(x,P,deg,0,edge),options);
        x
        exitflag1=1;
        if exitflag ~= 1 %&& exitflag ~= 4 && exitflag ~= 5 %&& exitflag ~= 0
            disp('------------------------------------------')
            disp('*****Direction of search is transited*****')
            disp('------------------------------------------')
            [x,fv,exitflag1,iteration]= fmincon(@(x)AOF(x,deg,0,edge,0),x0,[],[],[],[],lb,ub,...
                @(x)const(x,P,deg,1,edge),options);
            x
            iteration
        s(k)=iteration.iterations
        end
            ParetoX(:,k)=x(:,1);
            ParetoF(:,k) = Objective_Evaluation(ParetoX(:,k),45,1);
            k = k+1;
%             x0=x; %----in 3d it is necessary for shpere
             sum(s)/k
            
%             if exitflag1 ~=1 && exitflag ~=1 %--its good for comet 3D
%                 ParetoX(:,k-1)=NaN;
%                 ParetoF(:,k-1) = NaN;
%             end
%             
        
    end
    
end
time=toc;
