! What is the 10 001st prime number?

program p7
  implicit none

  print *, nth_prime(10001)

contains

  function nth_prime(n)
    ! NOTE: does not work on 2, the first prime
    integer :: nth_prime
    integer :: n
    integer :: i, count
    i = 3
    count = 1
    do while (count < n)
       if (is_prime(i)) then
          count = count + 1
       end if
       i = i + 2
    end do
    nth_prime = i - 2
  end function nth_prime

  function is_prime(n)
    ! NOTE: does not work on 2, the only even prime
    logical :: is_prime
    integer :: n
    integer :: i, sq
    logical :: out
    out = mod(n, 2) /= 0
    sq = int(sqrt(n + 0.0))
    i = 3
    do while (and(out, i <= sq))
       out = mod(n, i) /= 0
       i = i + 2
    end do
    is_prime = out
  end function is_prime

end program p7
! 104743
