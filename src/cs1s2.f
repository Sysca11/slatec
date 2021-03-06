*DECK CS1S2
      SUBROUTINE CS1S2 (ZR, S1, S2, NZ, ASCLE, ALIM, IUF)
C***BEGIN PROLOGUE  CS1S2
C***SUBSIDIARY
C***PURPOSE  Subsidiary to CAIRY and CBESK
C***LIBRARY   SLATEC
C***TYPE      ALL (CS1S2-A, ZS1S2-A)
C***AUTHOR  Amos, D. E., (SNL)
C***DESCRIPTION
C
C     CS1S2 TESTS FOR A POSSIBLE UNDERFLOW RESULTING FROM THE
C     ADDITION OF THE I AND K FUNCTIONS IN THE ANALYTIC CON-
C     TINUATION FORMULA WHERE S1=K FUNCTION AND S2=I FUNCTION.
C     ON KODE=1 THE I AND K FUNCTIONS ARE DIFFERENT ORDERS OF
C     MAGNITUDE, BUT FOR KODE=2 THEY CAN BE OF THE SAME ORDER
C     OF MAGNITUDE AND THE MAXIMUM MUST BE AT LEAST ONE
C     PRECISION ABOVE THE UNDERFLOW LIMIT.
C
C***SEE ALSO  CAIRY, CBESK
C***ROUTINES CALLED  (NONE)
C***REVISION HISTORY  (YYMMDD)
C   830501  DATE WRITTEN
C   910415  Prologue converted to Version 4.0 format.  (BAB)
C***END PROLOGUE  CS1S2
      COMPLEX CZERO, C1, S1, S1D, S2, ZR
      REAL AA, ALIM, ALN, ASCLE, AS1, AS2, XX
      INTEGER IUF, NZ
      DATA CZERO / (0.0E0,0.0E0) /
C***FIRST EXECUTABLE STATEMENT  CS1S2
      NZ = 0
      AS1 = ABS(S1)
      AS2 = ABS(S2)
      AA = REAL(S1)
      ALN = AIMAG(S1)
      IF (AA.EQ.0.0E0 .AND. ALN.EQ.0.0E0) GO TO 10
      IF (AS1.EQ.0.0E0) GO TO 10
      XX = REAL(ZR)
      ALN = -XX - XX + ALOG(AS1)
      S1D = S1
      S1 = CZERO
      AS1 = 0.0E0
      IF (ALN.LT.(-ALIM)) GO TO 10
      C1 = CLOG(S1D) - ZR - ZR
      S1 = CEXP(C1)
      AS1 = ABS(S1)
      IUF = IUF + 1
   10 CONTINUE
      AA = MAX(AS1,AS2)
      IF (AA.GT.ASCLE) RETURN
      S1 = CZERO
      S2 = CZERO
      NZ = 1
      IUF = 0
      RETURN
      END
