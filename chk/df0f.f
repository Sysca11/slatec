*DECK DF0F
      DOUBLE PRECISION FUNCTION DF0F (X)
C***BEGIN PROLOGUE  DF0F
C***PURPOSE  Subsidiary to
C***LIBRARY   SLATEC
C***AUTHOR  (UNKNOWN)
C***ROUTINES CALLED  (NONE)
C***REVISION HISTORY  (YYMMDD)
C   ??????  DATE WRITTEN
C   891214  Prologue converted to Version 4.0 format.  (BAB)
C***END PROLOGUE  DF0F
      DOUBLE PRECISION X
C***FIRST EXECUTABLE STATEMENT  DF0F
      DF0F = 0.0D+00
      IF(X.NE.0.0D+00) DF0F = SIN(0.5D+02*X)/(X*SQRT(X))
      RETURN
      END
