
% Copyright 2023 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Anni Liu

% Interpret the function: http://edx-org-utaustinx.s3.amazonaws.com/UT501x/PictureFLAME/PictureFLAME.html

function [ y_out ] = Mvmult_t_unb_var1( A, x, y )

  [ AL, AR ] = FLA_Part_1x2( A, ...
                               0, 'FLA_LEFT' );

  [ yT, ...
    yB ] = FLA_Part_2x1( y, ...
                         0, 'FLA_TOP' );

  while ( size( AL, 2 ) < size( A, 2 ) )

    [ A0, a1, A2 ]= FLA_Repart_1x2_to_1x3( AL, AR, ...
                                         1, 'FLA_RIGHT' );

    [ y0, ...
      psi1, ...
      y2 ] = FLA_Repart_2x1_to_3x1( yT, ...
                                    yB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%

    psi1 = laff_dot( a1, x ) + psi1;

    %------------------------------------------------------------%

    [ AL, AR ] = FLA_Cont_with_1x3_to_1x2( A0, a1, A2, ...
                                           'FLA_LEFT' );

    [ yT, ...
      yB ] = FLA_Cont_with_3x1_to_2x1( y0, ...
                                       psi1, ...
                                       y2, ...
                                       'FLA_TOP' );

  end

  y_out = [ yT
            yB ];

return

% Test the function
A = randi( [ -2, 2 ], 4, 4 )
x = randi( [ -2, 2 ], 4, 1 )
y = randi( [ -2, 2 ], 4, 1 )

if ( isequal( Mvmult_t_unb_var1( A, x, y ), A' * x + y ) )
    disp( 'Mvmult_t_unb_var1 appears to be correct' )
else
    disp( 'Mvmult_t_unb_var1 has a problem' )
end
