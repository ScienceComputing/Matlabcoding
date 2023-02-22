
% Copyright 2023 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Anni Liu

% Interpret the function: http://edx-org-utaustinx.s3.amazonaws.com/UT501x/PictureFLAME/PictureFLAME.html

function [ C_out ] = Gemm_unb_var3( A, B, C )

  [ AL, AR ] = FLA_Part_1x2( A, ...
                               0, 'FLA_LEFT' );

  [ BT, ...
    BB ] = FLA_Part_2x1( B, ...
                         0, 'FLA_TOP' );

  while ( size( AL, 2 ) < size( A, 2 ) )

    [ A0, a1, A2 ]= FLA_Repart_1x2_to_1x3( AL, AR, ...
                                         1, 'FLA_RIGHT' );

    [ B0, ...
      b1t, ...
      B2 ] = FLA_Repart_2x1_to_3x1( BT, ...
                                    BB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%

    C = laff_ger(1, a1, b1t, C);

    %------------------------------------------------------------%

    [ AL, AR ] = FLA_Cont_with_1x3_to_1x2( A0, a1, A2, ...
                                           'FLA_LEFT' );

    [ BT, ...
      BB ] = FLA_Cont_with_3x1_to_2x1( B0, ...
                                       b1t, ...
                                       B2, ...
                                       'FLA_TOP' );

  end

  C_out = C;


return

% Test the function
m = 5;
n = 3;
k = 4;

C = randi( [-2,2], m, n )
A = randi( [-2,2], m, k )
B = randi( [-2,2], k, n )

% Compute A * B + C via MatMatMult
Gemm_unb_var3( A, B, C )

% Compute A * B + C
A * B + C

% Check if they compute the same
if ( isequal( Gemm_unb_var3( A, B, C ), A * B + C ) )
    disp( 'it appears Gemm_unb_var3 computes correctly' )
else
    disp( 'Gemm_unb_var3 has a problem' )
end
