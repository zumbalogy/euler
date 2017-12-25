! What is the 10 001st prime number?

program p7
  implicit none

  print *, nth_prime(10001)

contains

  function nth_prime(n)
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
    logical :: is_prime
    integer :: n
    integer :: i, sq
    logical :: out

    out = .true.
    i = 3
    sq = int(sqrt(n + 0.0))

    if (0 == mod(n, 2)) then
       out = .false.
    end if

    do while (and(out, i < sq + 1))
       if (0 == mod(n, i)) then
          out = .false.
       end if
       i = i + 2
    end do

    is_prime = out

  end function is_prime

end program p7

! 104743
