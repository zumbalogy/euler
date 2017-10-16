! The natural numbers below 10 that are multiples of 3 or 5 are 3, 5, 6 and 9.
! The sum of these multiples is 23.
! Find the sum of all the multiples of 3 or 5 below 1000.

program p1
  implicit none

  write(*,*) sum_step(5, 1000) + sum_step(3, 1000) - sum_step(15, 1000)
  write(*,*) 233168
  write(*,*) sum_step(3,10)

contains

  integer function sum_step(step, limit)
    integer :: step
    integer :: limit
    integer :: x
    integer :: y

    x = (limit - 1) / step

    y = ((x * x) + x) / 2
    sum_step = y * step
    return
  end function sum_step

end program p1
