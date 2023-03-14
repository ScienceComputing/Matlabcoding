
% Copyright 2023 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Anni Liu

function [ A_out, b_out ] = Solve( A, b )
%  Solves A x = b

LU = LU_unb_var5( A );

z = Ltrsv_unb_var1( LU, b );

x = Utrsv_unb_var1( LU, z );

A_out = LU;

b_out = x;

end

% Test the function
% Create a matrix.  (This matrix was carefully chosen so that only integers
% are encountered during the process.)

A = [
     2     0     1     2 
    -2    -1     1    -1 
     4    -1     5     4 
    -4     1    -3    -8 
]

% Create a right-hand size vector b

b = [
     2
     2
    11
    -3
]

% Solve A x = b

[ LU, x ] = Solve( A, b ) 

% Check that A x = b

b - A * x
