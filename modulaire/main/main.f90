PROGRAM main
  USE mon_module

  REAL :: x, y, resultat

  x = 2.0
  y = 3.0

  CALL somme(x, y, resultat)

  WRITE(*,*) "La somme de", x, "et", y, "est", resultat

END PROGRAM main
