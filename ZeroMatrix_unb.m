% Copyright 2023 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Anni Liu
%                ali4006@med.cornell.edu

% Interpret the function: http://edx-org-utaustinx.s3.amazonaws.com/UT501x/PictureFLAME/PictureFLAME.html

function [ A_out ] = ZeroMatrix_unb( A )


  % Partition A into left part and right part and there are 0 columns in
  % the left part
  [ AL, AR ] = FLA_Part_1x2( A, ...
                               0, 'FLA_LEFT' );

  while ( size( AL, 2 ) < size( A, 2 ) ) % size( A, 2 ) the number of columns of A

    [ A0, a1, A2 ]= FLA_Repart_1x2_to_1x3( AL, AR, ...
                                         1, 'FLA_RIGHT' );

    %------------------------------------------------------------%

    a1 = laff_zerov( a1 );

    %------------------------------------------------------------%

    [ AL, AR ] = FLA_Cont_with_1x3_to_1x2( A0, a1, A2, ...
                                           'FLA_LEFT' );

  end

  A_out = [ AL, AR ];

return

% A = randi( [ -2, 2 ], 5, 4 )
% A =

%     2    -2    -2    -2
%     2    -1     2     0
%    -2     0     2     2
%     2     2     0     1
%     1     2     2     2

% ZeroMatrix_unb(A)
