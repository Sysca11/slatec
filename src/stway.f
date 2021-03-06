*DECK STWAY
      SUBROUTINE STWAY (U, V, YHP, INOUT, STOWA)
C***BEGIN PROLOGUE  STWAY
C***SUBSIDIARY
C***PURPOSE  Subsidiary to BVSUP
C***LIBRARY   SLATEC
C***TYPE      SINGLE PRECISION (STWAY-S, DSTWAY-D)
C***AUTHOR  Watts, H. A., (SNLA)
C***DESCRIPTION
C
C  This subroutine stores (recalls) integration data in the event
C  that a restart is needed (the homogeneous solution vectors become
C  too dependent to continue)
C
C***SEE ALSO  BVSUP
C***ROUTINES CALLED  STOR1
C***COMMON BLOCKS    ML15TO, ML18JR, ML8SZ
C***REVISION HISTORY  (YYMMDD)
C   750601  DATE WRITTEN
C   890921  Realigned order of variables in certain COMMON blocks.
C           (WRB)
C   891214  Prologue converted to Version 4.0 format.  (BAB)
C   900328  Added TYPE section.  (WRB)
C   910722  Updated AUTHOR section.  (ALS)
C***END PROLOGUE  STWAY
C
      DIMENSION U(*),V(*),YHP(*),STOWA(*)
C
      COMMON /ML8SZ/ C,XSAV,IGOFX,INHOMO,IVP,NCOMP,NFC
      COMMON /ML15TO/ PX,PWCND,TND,X,XBEG,XEND,XOT,XOP,INFO(15),ISTKOP,
     1                KNSWOT,KOP,LOTJP,MNSWOT,NSWOT
      COMMON /ML18JR/ AE,RE,TOL,NXPTS,NIC,NOPG,MXNON,NDISK,NTAPE,NEQ,
     1                INDPVT,INTEG,NPS,NTP,NEQIVP,NUMORT,NFCC,
     2                ICOCO
C
C***FIRST EXECUTABLE STATEMENT  STWAY
      IF (INOUT .EQ. 1) GO TO 100
C
C     SAVE IN STOWA ARRAY AND ISTKOP
C
      KS=NFC*NCOMP
      CALL STOR1(STOWA,U,STOWA(KS+1),V,1,0,0)
      KS=KS+NCOMP
      IF (NEQIVP .EQ. 0) GO TO 50
      DO 25 J=1,NEQIVP
      KSJ=KS+J
   25 STOWA(KSJ)=YHP(KSJ)
   50 KS=KS+NEQIVP
      STOWA(KS+1)=X
      ISTKOP=KOP
      IF (XOP .EQ. X) ISTKOP=KOP+1
      RETURN
C
C     RECALL FROM STOWA ARRAY AND ISTKOP
C
  100 KS=NFC*NCOMP
      CALL STOR1(YHP,STOWA,YHP(KS+1),STOWA(KS+1),1,0,0)
      KS=KS+NCOMP
      IF (NEQIVP .EQ. 0) GO TO 150
      DO 125 J=1,NEQIVP
      KSJ=KS+J
  125 YHP(KSJ)=STOWA(KSJ)
  150 KS=KS+NEQIVP
      X=STOWA(KS+1)
      INFO(1)=0
      KO=KOP-ISTKOP
      KOP=ISTKOP
      IF (NDISK .EQ. 0  .OR.  KO .EQ. 0) RETURN
      DO 175 K=1,KO
  175 BACKSPACE NTAPE
      RETURN
      END
