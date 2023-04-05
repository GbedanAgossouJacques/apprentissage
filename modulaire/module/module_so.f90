MODULE mon_module
  IMPLICIT NONE
  CONTAINS

  SUBROUTINE somme(a, b, resultat)
    REAL, INTENT(IN) :: a, b
    REAL, INTENT(OUT) :: resultat

    resultat = a + b
  END SUBROUTINE somme

END MODULE mon_module
