% Copyright 2023 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Anni Liu

% Interpret the function: http://edx-org-utaustinx.s3.amazonaws.com/UT501x/PictureFLAME/PictureFLAME.html

function [ C_out ] = Gemm_unb_var1( A, B, C )

  [ BL, BR ] = FLA_Part_1x2( B, ...
                               0, 'FLA_LEFT' );

  [ CL, CR ] = FLA_Part_1x2( C, ...
                               0, 'FLA_LEFT' );

  while ( size( BL, 2 ) < size( B, 2 ) )

    [ B0, b1, B2 ]= FLA_Repart_1x2_to_1x3( BL, BR, ...
                                         1, 'FLA_RIGHT' );

    [ C0, c1, C2 ]= FLA_Repart_1x2_to_1x3( CL, CR, ...
                                         1, 'FLA_RIGHT' );

    %------------------------------------------------------------%

    c1 = laff_gemv( 'No transpose', 1, A, b1, 1, c1 );
    
    %------------------------------------------------------------%

    [ BL, BR ] = FLA_Cont_with_1x3_to_1x2( B0, b1, B2, ...
                                           'FLA_LEFT' );

    [ CL, CR ] = FLA_Cont_with_1x3_to_1x2( C0, c1, C2, ...
                                           'FLA_LEFT' );

  end

  C_out = [ CL, CR ];

return

% Test the function
m = 5;
n = 3;
k = 4;

C = randi( [-2,2], m, n )
A = randi( [-2,2], m, k )
B = randi( [-2,2], k, n )

% Compute A * B + C via MatMatMult
Gemm_unb_var1( A, B, C )

% Compute A * B + C
A * B + C

% Check if they compute the same
if ( isequal( Gemm_unb_var1( A, B, C ), A * B + C ) )
    disp( 'it appears Gemm_unb_var1 computes correctly' )
else
    disp( 'Gemm_unb_var1 has a problem' )
end
