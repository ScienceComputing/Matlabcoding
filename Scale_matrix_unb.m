% Copyright 2023 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Anni Liu

% Interpret the function: http://edx-org-utaustinx.s3.amazonaws.com/UT501x/PictureFLAME/PictureFLAME.html

function [ A_out ] = Scale_matrix_unb( beta, A )

  [ AL, AR ] = FLA_Part_1x2( A, ...
                               0, 'FLA_LEFT' );

  while ( size( AL, 2 ) < size( A, 2 ) )

    [ A0, a1, A2 ]= FLA_Repart_1x2_to_1x3( AL, AR, ...
                                         1, 'FLA_RIGHT' );

    %------------------------------------------------------------%

    a1 = laff_scal(beta, a1);

    %------------------------------------------------------------%

    [ AL, AR ] = FLA_Cont_with_1x3_to_1x2( A0, a1, A2, ...
                                           'FLA_LEFT' );

  end

  A_out = [ AL, AR ];

return

% Test the function:
% A = randi([-2,2], 4, 4)
% Scale_matrix_unb( 3, A )
