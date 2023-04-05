program my_lapack

implicit none

! Paramètres de la matrice
integer, parameter :: m = 4
integer, parameter :: n = 3

! Matrice
real(kind=8), dimension(m,n) :: a

! Valeurs singulières
real(kind=8), dimension(min(m,n)) :: s

! Matrices de gauche et de droite de la SVD
real(kind=8), dimension(m,m) :: u
real(kind=8), dimension(n,n) :: vt

! Variables temporaires
integer :: i, j, info

! Initialisation de la matrice a
do j=1,n
    do i=1,m
        a(i,j) = dble((i-1)*n + j)
    end do
end do

! Calcul de la SVD de la matrice a
call dgesvd('A', 'A', m, n, a, m, s, u, m, vt, n, work, lwork, info)

! Affichage des résultats
write(*,*) 'Matrice a :'
do i=1,m
    write(*,*) (a(i,j), j=1,n)
end do

write(*,*)
write(*,*) 'Matrice U :'
do i=1,m
    write(*,*) (u(i,j), j=1,m)
end do

write(*,*)
write(*,*) 'Valeurs singulières :'
write(*,*) s

write(*,*)
write(*,*) 'Matrice Vt :'
do i=1,n
    write(*,*) (vt(i,j), j=1,n)
end do

end program my_lapack
