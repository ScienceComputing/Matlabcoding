function [ C_out ] = MatMatMult( A, B, C ) 

[ m, n ] = size( C );
[ m_A, k ] = size( A );
[ m_B, n_B ] = size( B );

for j = 1:n 
   for i = 1:m 
      for p = 1:k 
         C( i,j ) = A( i,p ) * B( p,j ) + C( i,j );
      end 
   end 
end 

C_out = C;


function [ C_out ] = MatMatMult( A, B, C ) 

[ m, n ] = size( C );
[ m_A, k ] = size( A );
[ m_B, n_B ] = size( B );

for j = 1:n 
   for p = 1:k 
      for i = 1:m 
         C( i,j ) = A( i, p ) * B( p, j ) + C( i, j );
      end 
   end 
end 

C_out = C;


% Test the function
m = 5;
n = 3;
k = 4;

C = randi( [-2,2], m, n )
A = randi( [-2,2], m, k )
B = randi( [-2,2], k, n )

% Compute A * B + C via MatMatMult
MatMatMult( A, B, C )

% Compute A * B + C
A * B + C

% Check if they compute the same
if ( isequal( MatMatMult( A, B, C ), A * B + C ) )
    disp( 'it appears MatMatMult computes correctly' )
else
    disp( 'MatMatMult has a problem' )
end
