% Copyright 2023 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Anni Liu

% Interpret the function: http://edx-org-utaustinx.s3.amazonaws.com/UT501x/PictureFLAME/PictureFLAME.html

function [ C_out ] = Gemm_unb_var2( A, B, C )

  [ AT, ...
    AB ] = FLA_Part_2x1( A, ...
                         0, 'FLA_TOP' );

  [ CT, ...
    CB ] = FLA_Part_2x1( C, ...
                         0, 'FLA_TOP' );

  while ( size( AT, 1 ) < size( A, 1 ) )

    [ A0, ...
      a1t, ...
      A2 ] = FLA_Repart_2x1_to_3x1( AT, ...
                                    AB, ...
                                    1, 'FLA_BOTTOM' );

    [ C0, ...
      c1t, ...
      C2 ] = FLA_Repart_2x1_to_3x1( CT, ...
                                    CB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%

    c1t = laff_gemv( 'Transpose', 1, B, a1t, 1, c1t );

    %------------------------------------------------------------%

    [ AT, ...
      AB ] = FLA_Cont_with_3x1_to_2x1( A0, ...
                                       a1t, ...
                                       A2, ...
                                       'FLA_TOP' );

    [ CT, ...
      CB ] = FLA_Cont_with_3x1_to_2x1( C0, ...
                                       c1t, ...
                                       C2, ...
                                       'FLA_TOP' );

  end

  C_out = [ CT
            CB ];

return

% Test the function
m = 5;
n = 3;
k = 4;

C = randi( [-2,2], m, n )
A = randi( [-2,2], m, k )
B = randi( [-2,2], k, n )

% Compute A * B + C via MatMatMult
Gemm_unb_var2( A, B, C )

% Compute A * B + C
A * B + C

% Check if they compute the same
if ( isequal( Gemm_unb_var2( A, B, C ), A * B + C ) )
    disp( 'it appears Gemm_unb_var2 computes correctly' )
else
    disp( 'Gemm_unb_var2 has a problem' )
end
