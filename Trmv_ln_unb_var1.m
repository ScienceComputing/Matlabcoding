
% Copyright 2023 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Anni Liu

% Interpret the function: http://edx-org-utaustinx.s3.amazonaws.com/UT501x/PictureFLAME/PictureFLAME.html

function [ x_out ] = Trmv_ln_unb_var1( L, x )

  [ LTL, LTR, ...
    LBL, LBR ] = FLA_Part_2x2( L, ...
                               0, 0, 'FLA_BR' );

  [ xT, ...
    xB ] = FLA_Part_2x1( x, ...
                         0, 'FLA_BOTTOM' );

  while ( size( LBR, 1 ) < size( L, 1 ) )

    [ L00,  l01,      L02,  ...
      l10t, lambda11, l12t, ...
      L20,  l21,      L22 ] = FLA_Repart_2x2_to_3x3( LTL, LTR, ...
                                                     LBL, LBR, ...
                                                     1, 1, 'FLA_TL' );

    [ x0, ...
      chi1, ...
      x2 ] = FLA_Repart_2x1_to_3x1( xT, ...
                                    xB, ...
                                    1, 'FLA_TOP' );

    %------------------------------------------------------------%

    chi1 = lambda11 * chi1;
    chi1 = l10t * x0 + chi1;

    %------------------------------------------------------------%

    [ LTL, LTR, ...
      LBL, LBR ] = FLA_Cont_with_3x3_to_2x2( L00,  l01,      L02,  ...
                                             l10t, lambda11, l12t, ...
                                             L20,  l21,      L22, ...
                                             'FLA_BR' );

    [ xT, ...
      xB ] = FLA_Cont_with_3x1_to_2x1( x0, ...
                                       chi1, ...
                                       x2, ...
                                       'FLA_BOTTOM' );

  end

  x_out = [ xT
            xB ];

return

% Test the function
A = randi( [ -2, 2 ], 4, 4 )
x = randi( [ -2, 2 ], 4, 1 )

if ( isequal( Trmv_ln_unb_var1( A, x ), tril( A ) * x  ) )
    disp( 'Trmv_ln_unb_var1 appears to be correct' )
else
    disp( 'Trmv_ln_unb_var1 has a problem' )
end
