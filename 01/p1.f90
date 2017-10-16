! The natural numbers below 10 that are multiples of 3 or 5 are 3, 5, 6 and 9.
! The sum of these multiples is 23.
! Find the sum of all the multiples of 3 or 5 below 1000.

program p1
  implicit none
  integer :: i
  integer :: out

  out = 0

  do i = 1,999
     if (0 == mod(i,3)) then
        out = out + i
     else if (0 == mod(i,5)) then
        out = out + i
     end if
  end do

  write(*,*) out

end program p1

! 233168
