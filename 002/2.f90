! Each new term in the Fibonacci sequence is generated by
! adding the previous two terms.
! By starting with 1 and 2, the first 10 terms will be:
! 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

! Sum the even terms in the Fibonacci sequence under four million

program p2
  implicit none
  integer :: a, b, c, sum

  sum = 0
  a = 0
  b = 1

  do while (b < 4000000)
    c = a + b
    a = b + c
    b = a + c
    sum = sum + a
  end do

  print *, sum

end program p2

! 4613732
