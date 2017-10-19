! The prime factors of 13195 are 5, 7, 13 and 29.
! What is the largest prime factor of the number 600851475143?


program p3
  implicit none

  integer, parameter :: long = 8
  integer (kind=long) :: initial_number

  initial_number = 600851475143_long

  print *, largest_factor(initial_number)

contains

  integer function largest_factor(input)
    integer (kind=long) :: input
    integer :: i

    i = 2

    do while (i * i < input)

       if (0 == mod(input, i)) then
          input = input / i
       else
          i = i + 1
       end if

    end do

    largest_factor = input
    return
  end function largest_factor


end program p3
! 6857
