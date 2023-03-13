% Copyright 2023 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Anni Liu

function [ b_out ] = Utrsv_unb_var1( U, b )

  [ UTL, UTR, ...
    UBL, UBR ] = FLA_Part_2x2( U, ...
                               0, 0, 'FLA_BR' );

  [ bT, ...
    bB ] = FLA_Part_2x1( b, ...
                         0, 'FLA_BOTTOM' );

  while ( size( UBR, 1 ) < size( U, 1 ) )

    [ U00,  u01,       U02,  ...
      u10t, upsilon11, u12t, ...
      U20,  u21,       U22 ] = FLA_Repart_2x2_to_3x3( UTL, UTR, ...
                                                      UBL, UBR, ...
                                                      1, 1, 'FLA_TL' );

    [ b0, ...
      beta1, ...
      b2 ] = FLA_Repart_2x1_to_3x1( bT, ...
                                    bB, ...
                                    1, 'FLA_TOP' );

    %------------------------------------------------------------%

    beta1 = beta1 - laff_dot( u12t, b2 );
    beta1 = beta1 / upsilon11;

    %------------------------------------------------------------%

    [ UTL, UTR, ...
      UBL, UBR ] = FLA_Cont_with_3x3_to_2x2( U00,  u01,       U02,  ...
                                             u10t, upsilon11, u12t, ...
                                             U20,  u21,       U22, ...
                                             'FLA_BR' );

    [ bT, ...
      bB ] = FLA_Cont_with_3x1_to_2x1( b0, ...
                                       beta1, ...
                                       b2, ...
                                       'FLA_BOTTOM' );

  end

  b_out = [ bT
            bB ];

return

% Test the function
% Create an upper triangular matrixmatrix.  
% (This matrix was carefully chosen so that only integers
% are encountered during the process.)

U = [
     2     0     1     2
     0    -1     2     1
     0     0     1    -1
     0     0     0    -2

]

% Create a right-hand side.  We are going to solve U x = b

b = [
     2
     4
     3
     2

]

% Solve U x = b

x = Utrsv_unb_var1( U, b )

% Check that U x = b

b - U * x

