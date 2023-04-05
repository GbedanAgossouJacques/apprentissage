!************************************************************
! Simultaneous equations solving by Gauss-Elimination method
!
!   date          name            version
!   2018.12.05    mk-mode.com     1.00 新規作成
!
! Copyright(C) 2018 mk-mode.com All Rights Reserved.
!************************************************************
!
module const
  ! SP: 単精度(4), DP: 倍精度(8)
  integer,     parameter :: SP = kind(1.0)
  integer(SP), parameter :: DP = selected_real_kind(2 * precision(1.0_SP))
end module const

module gauss_elimination
  use const
  implicit none
  private
  public :: solve

contains
  ! 連立方程式を解く
  !
  ! :param(in)    integer(4)     n: 元数
  ! :param(inout) real(8) a(n,n+1): 係数配列
  subroutine solve(n, a)
    implicit none
    integer(SP), intent(in)    :: n
    real(DP),    intent(inout) :: a(n, n + 1)
    integer(SP) :: i, j
    real(DP)    :: d

    ! 前進消去
    do j = 1, n - 1
      do i = j + 1, n
        d = a(i, j) / a(j, j)
        a(i, j+1:n+1) = a(i, j+1:n+1) - a(j, j+1:n+1) * d
      end do
    end do

    ! 後退代入
    do i = n, 1, -1
      d = a(i, n + 1)
      do j = i + 1, n
        d = d - a(i, j) * a(j, n + 1)
      end do
      a(i, n + 1) = d / a(i, i)
    end do
  end subroutine solve
end module gauss_elimination

!> \brief Computes the sum of two integers
!! \param[in] a Integer to be added
!! \param[in] b Integer to be added
!! \return Sum of integers a and b
function add(a, b) result(sum)
   integer, intent(in) :: a, b
   integer :: sum
   sum = a + b
end function add


program simultaneous_equations
  use const
  use gauss_elimination
  implicit none
  integer(SP)   :: n, i            ! 元数、ループインデックス
  character(20) :: f               ! 書式文字列
  real(DP), allocatable :: a(:,:)  ! 係数配列

  ! 元数取得
  write (*, '(A)', advance="no") "n ? "
  read (*, *) n

  ! 配列メモリ確保
  allocate(a(n, n + 1))

  ! 係数取得
  do i = 1, n
    write (*, '("row(", I0, ",1:", I0, ") ? ")', advance="no") i, n + 1
    read (*, *) a(i,:)
  end do
  write (*, '(/A)') "Coefficients:"
  write (f, '("(", I0, "(F8.2, 2X)", ")")') n + 1
  do i = 1, n
    write (*, f) a(i,:)
  end do

  ! 連立方程式を解く
  ! (計算後 a の最右列が解)
  call solve(n, a)

  ! 結果出力
  write (*, '(A)') "Answer:"
  write (f, '("(", I0, "(F8.2, 2X)", ")")') n
  write (*, f) a(:, n + 1)

  ! 配列メモリ解放
  deallocate(a)
end program simultaneous_equations