! Given a histogram (as a list of bar heights), how many units of water could it hold?
! For example, a histogram [3 0 3] could hold 3 units. [2 0 0 3 0 6] could hold 7.

!      |
! |    |
! |  | |
! |__|_|

! would be [3 0 0 2 0 4] and could hold 10 units.


program histogram
  implicit none

  print*, count_water([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1])
  ! 6

contains

  integer function count_water(histo)
    implicit none
    integer :: histo(:)
    integer :: left, right
    integer :: i, j, k

    count_water = 0

    do i = 1, size(histo)
       left = 0
       right = 0

       do j = 1, i
          left = max(left, histo(j))
       end do

       do k = (i + 1), size(histo)
          right = max(right, histo(k))
       end do

       count_water = count_water + max(0, min(left, right) - histo(i))
    end do
  end function count_water
end program histogram
