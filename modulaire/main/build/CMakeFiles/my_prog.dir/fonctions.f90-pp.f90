# 1 "C:/Users/ADMIN/3D Objects/code fortran/apprentissage/modulaire/main/fonctions.f90"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "C:/Users/ADMIN/3D Objects/code fortran/apprentissage/modulaire/main/fonctions.f90"
module user_functions
    implicit none
contains

real function f( x )
    real, intent(in) :: x
    f = x - x**2 + sin(x)
end function f

end module user_functions
