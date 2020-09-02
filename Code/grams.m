function [Q, R] = grams(l0,l)

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



% grams  Gram-Schmidt orthogonalization of the columns of A.
% The columns of A are assumed to be linearly independent.
%
% Q = grams(A) returns an m by n matrix Q whose columns are 
% an orthonormal basis for the column space of A.
%
% [Q, R] = grams(A) returns a matrix Q with orthonormal columns
% and an invertible upper triangular matrix R so that A = Q*R.
%
% Warning: For a more stable algorithm, use [Q, R] = qr(A, 0) .

%e3=[1;1;1];  %<---3D
%A=[l0' l' e3]; %<---3D

A=[l0' l']; %<---2D
if isequal(l0,l) || isequal(-l0,l) || isequal(l0,-l)
    Q=eye(size(A));
else
    
    [m, n] = size(A);
    Asave = A;
    for j = 1:n
        for k = 1:j-1
            mult = (A(:, j)'*A(:, k)) / (A(:, k)'*A(:, k));
            A(:, j) = A(:, j) - mult*A(:, k);
        end
    end
    for j = 1:n
        if norm(A(:, j)) < sqrt(eps)
            Q=eye(size(A));
            break  % error('Columns of A are linearly dependent.')
        end
        Q(:, j) = A(:, j) / norm(A(:, j));
    end
    R = Q'*Asave;
    
%     %--finding the other basis b3 to b_ns
%     for i=1:2 %ns=2
%     end
%     
end


