!> @brief inserts a value into an ordered array
!!
!! An array "list" consisting of n ascending ordered values. The method insert a
!! "new_entry" into the array.
!! hint: use cshift and eo-shift
!!
!! @param[in,out]   list    a real array, size: max_size
!! @param[in]       n       current values in the array
!! @param[in]       max_size    size if the array
!! @param[in]       new_entry   the value to insert
subroutine in(list, n, max_size, new_entry)
    implicit none 
    real, dimension (:), intent (inout) :: list; k 
    integer, intent (in) :: n, max_size
    real, intent (in) :: new_entry

    write(*,*) "hello" 

    ! code ........
end subroutine in 