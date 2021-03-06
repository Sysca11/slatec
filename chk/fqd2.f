*DECK FQD2
      REAL FUNCTION FQD2 (X)
C***BEGIN PROLOGUE  FQD2
C***SUBSIDIARY
C***PURPOSE  Function evaluator for QNC79 and GAUS8 quick checks.
C***LIBRARY   SLATEC
C***TYPE      SINGLE PRECISION (FQD2-S, DFQD2-D)
C***AUTHOR  Boland, W. Robert, (LANL)
C***SEE ALSO  QG8TST, QN79QX
C***ROUTINES CALLED  (NONE)
C***REVISION HISTORY  (YYMMDD)
C   920229  DATE WRITTEN
C***END PROLOGUE  FQD2
C     .. Scalar Arguments ..
      REAL X
C     .. Intrinsic Functions ..
      INTRINSIC COS, EXP
C***FIRST EXECUTABLE STATEMENT  FQD2
      FQD2 = EXP(X)*COS(10.0E0*X)
      RETURN
      END
