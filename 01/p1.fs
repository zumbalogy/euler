(
  The natural numbers below 10 that are multiples of 3 or 5 are 3, 5, 6 and 9.
  The sum of these multiples is 23.
  Find the sum of all the multiples of 3 or 5 below 1000.
)

: sum_under dup dup * + 2 / ;
: sum_steps 1 - over / sum_under * ;

3  1000 sum_steps
5  1000 sum_steps +
15 1000 sum_steps -

. cr
( 233168 )
