(
  Each new term in the Fibonacci sequence is the sum of the previous 2 terms.
  Starting with 1 and 2, the first 10 terms are:
  1, 2, 3, 5, 8, 13, 21, 34, 55, 89

  Sum the even Fibonacci numbers under four million
)

: limit 4000000 ;

: even_fibs_under_limit
  0
  1 2
  begin
    rot over + rot rot

    over over + rot drop
    over over + rot drop
    over over + rot drop

    dup limit >
  until
  drop
  drop
;

even_fibs_under_limit

. cr
( 4613732 )
