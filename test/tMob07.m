MODULE tMob07;

IMPORT Out;

TYPE Fun = PROCEDURE (): REAL;

PROCEDURE A(k: INTEGER; x1, x2, x3, x4, x5: Fun): REAL;
  PROCEDURE B(): REAL;
  BEGIN
    k := k-1;
    RETURN A(k, B, x1, x2, x3, x4)
  END B;
VAR r: REAL;
BEGIN
  IF k <= 0 THEN r := x4() + x5() ELSE r := B() END
RETURN r
END A;

PROCEDURE One(): REAL; BEGIN RETURN FLT(1) END One;
PROCEDURE MOne(): REAL; BEGIN RETURN FLT(-1) END MOne;
PROCEDURE Zero(): REAL; BEGIN RETURN FLT(0) END Zero;

BEGIN
  Out.Real(A(10, One, MOne, MOne, One, Zero)); Out.Ln
END tMob07.

(*<<
-67.0000
>>*)

(*[[
!! (SYMFILE #tMob07 STAMP #tMob07.%main 1 #tMob07.m)
!! (CHKSUM STAMP)
!! 
MODULE tMob07 STAMP 0
IMPORT Out STAMP
ENDHDR

PROC tMob07.%1.B 4 12 0
SAVELINK
!   PROCEDURE B(): REAL;
!     k := k-1;
LDLW -4
LDNW 12
DEC
LDLW -4
STNW 12
!     RETURN A(k, B, x1, x2, x3, x4)
LDLW -4
LDNW 44
LDLW -4
LDNW 40
LDLW -4
LDNW 36
LDLW -4
LDNW 32
LDLW -4
LDNW 28
LDLW -4
LDNW 24
LDLW -4
LDNW 20
LDLW -4
LDNW 16
LDLW -4
GLOBAL tMob07.%1.B
LDLW -4
LDNW 12
GLOBAL tMob07.A
CALLF 11
RETURN
END

PROC tMob07.A 4 2 0
! PROCEDURE A(k: INTEGER; x1, x2, x3, x4, x5: Fun): REAL;
!   IF k <= 0 THEN r := x4() + x5() ELSE r := B() END
LDLW 12
JGTZ L4
LDLW 44
STATLINK
LDLW 40
NCHECK 15
CALLF 0
LDLW 52
STATLINK
LDLW 48
NCHECK 15
CALLF 0
FPLUS
STLF -4
JUMP L2
LABEL L4
LOCAL 0
STATLINK
GLOBAL tMob07.%1.B
CALLF 0
STLF -4
LABEL L2
! RETURN r
LDLF -4
RETURN
END

PROC tMob07.One 0 1 0
! PROCEDURE One(): REAL; BEGIN RETURN FLT(1) END One;
FCONST 1.0
RETURN
END

PROC tMob07.MOne 0 1 0
! PROCEDURE MOne(): REAL; BEGIN RETURN FLT(-1) END MOne;
FCONST -1.0
RETURN
END

PROC tMob07.Zero 0 1 0
! PROCEDURE Zero(): REAL; BEGIN RETURN FLT(0) END Zero;
FCONST 0.0
RETURN
END

PROC tMob07.%main 0 12 0
!   Out.Real(A(10, One, MOne, MOne, One, Zero)); Out.Ln
CONST 0
GLOBAL tMob07.Zero
CONST 0
GLOBAL tMob07.One
CONST 0
GLOBAL tMob07.MOne
CONST 0
GLOBAL tMob07.MOne
CONST 0
GLOBAL tMob07.One
CONST 10
GLOBAL tMob07.A
CALLF 11
GLOBAL Out.Real
CALL 1
GLOBAL Out.Ln
CALL 0
RETURN
END

! End of file
]]*)
