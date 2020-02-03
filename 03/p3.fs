\ The prime factors of 13195 are 5, 7, 13 and 29.
\ What is the largest prime factor of the number 600851475143?

: cut \ main cutter
  over over mod
  if
  else
    begin
      dup \ main cutter cutter
      rot \ cutter cutter main
      swap \ cutter main cutter
      / \ cutter main
      swap \ main cutter
      over over mod
    until
  then
  drop \ main
;

: factor
  2 cut

  1 \ n 1
  swap \ 1 n
  begin

    swap \ n 1
    2 + \ n 3

    over over \ n 3 n 3
    cut \ n1 3 n2
    rot drop \ 3 n
    swap \ n 3

    dup dup * \ n 3 9
    rot \ 3 9 n
    dup \ 3 9 n n
    rot \ 3 n n 9
    <= \ 3 n
  until
  swap drop
;

600851475143 factor
. cr
\ 6857
