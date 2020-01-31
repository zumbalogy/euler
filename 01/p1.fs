
: sum_under dup dup * + 2 / ;

: sum_steps 1 - over / sum_under * ;

3  1000 sum_steps
5  1000 sum_steps +
15 1000 sum_steps -

. cr
