      SUBROUTINE U9DMP(LNG, NCOL, WI, WR, DR, WD, DD)
C
C  THIS SUBROUTINE ASSUMES THAT THE TYPE (INTEGER, ETC.) OF THE DATA
C  IN THE PORT STACK IS NOT KNOWN - SO IT PRINTS OUT, IN ALL FORMATS
C  THE STACK CONTENTS, USING THE ARRAY OUTPUT ROUTINES APRNTX.
C
C  WRITTEN BY DAN WARNER, REVISED BY PHYL FOX, NOVEMBER 8, 1982.
C
C  INPUT PARAMETERS -
C
C    LNG      - AN INTEGER VECTOR ARRAY CONTAINING IN
C               LNG(1) THE LENGTH OF THE ARRAY IF LOGICAL
C               LNG(2) THE LENGTH OF THE ARRAY IF INTEGER
C               LNG(3) THE LENGTH OF THE ARRAY IF REAL
C               LNG(4) THE LENGTH OF THE ARRAY IF DOUBLE PRECISION
C               LNG(5) THE LENGTH OF THE ARRAY IF COMPLEX
C
C    NCOL     - THE NUMBER OF SPACES ACROSS A PRINTED LINE
C
C    WI       - THE FORMAT WIDTH FOR AN INTEGER
C
C    WR       - THE FORMAT WIDTH FOR A REAL (W IN 1PEW.D)
C
C    DR       - THE NUMBER OF DIGITS AFTER THE DECIMAL POINT
C               (THE D IN THE 1PEW.D FORMULA)
C
C    WD       - THE FORMAT WIDTH FOR A REAL (W IN 1PDW.D)
C
C    DD       - THE NUMBER OF DIGITS AFTER THE DECIMAL POINT
C               (THE D IN THE 1PDW.D FORMULA)
C
C
C  ERROR STATES - NONE.  U9DMP IS CALLED BY SETERR,
C  SO IT CANNOT CALL SETERR.
C
C
      INTEGER LNG(5), NCOL, WI, WR, DR, WD
      INTEGER DD
      COMMON /CSTAK/ DSTAK
      DOUBLE PRECISION DSTAK(500)
      INTEGER ERROUT, ISTAK(1000), I1MACH
      REAL RSTAK(1000)
      LOGICAL LSTAK(1000)
C/R
C     REAL CMSTAK(2,500)
C     EQUIVALENCE (DSTAK(1), CMSTAK(1,1))
C/C
      COMPLEX CMSTAK(500)
      EQUIVALENCE (DSTAK(1), CMSTAK(1))
C/
      EQUIVALENCE (DSTAK(1), ISTAK(1))
      EQUIVALENCE (DSTAK(1), LSTAK(1))
      EQUIVALENCE (DSTAK(1), RSTAK(1))
C
      ERROUT = I1MACH(4)
C
      WRITE (ERROUT,  1)
   1  FORMAT (14H0LOGICAL STACK)
      CALL A9RNTL(LSTAK, LNG(1), ERROUT, NCOL)
      WRITE (ERROUT,  2)
   2  FORMAT (14H0INTEGER STACK)
      CALL A9RNTI(ISTAK, LNG(2), ERROUT, NCOL, WI)
      WRITE (ERROUT,  3)
   3  FORMAT (11H0REAL STACK)
      CALL A9RNTR(RSTAK, LNG(3), ERROUT, NCOL, WR, DR)
      WRITE (ERROUT,  4)
   4  FORMAT (23H0DOUBLE PRECISION STACK)
      CALL A9RNTD(DSTAK, LNG(4), ERROUT, NCOL, WD, DD)
      WRITE (ERROUT,  5)
   5  FORMAT (14H0COMPLEX STACK)
      CALL A9RNTC(CMSTAK, LNG(5), ERROUT, NCOL, WR, DR)
C
      RETURN
      END
