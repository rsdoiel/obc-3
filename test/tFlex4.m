MODULE tFlex4;

(*<<
  2  4  7  3  6  9
  2  4  7  3  6  9
  2  4  7  3  8  9
>>*)

IMPORT Out;

TYPE Matrix = ARRAY OF ARRAY OF INTEGER;

VAR 
  a, c: POINTER TO Matrix;

PROCEDURE Print(VAR m: Matrix);
  VAR i, j: INTEGER;
BEGIN
  FOR i := 0 TO LEN(m, 1)-1 DO
    FOR j := 0 TO LEN(m, 2)-1 DO
      Out.Int(m[i,j], 3)
    END
  END;
  Out.Ln
END Print;

PROCEDURE CopyPrint(VAR m: Matrix);
  VAR mm: POINTER TO Matrix;
BEGIN  
  NEW(mm, LEN(m, 1), LEN(m, 2));
  mm^ := m;
  Print(mm^);
  mm[1][1] := 8;
  m := mm^
END CopyPrint;

BEGIN
  NEW(a, 2, 3); NEW(c, 2, 3);

  a[0][0] := 2; a[0][1] := 4; a[0][2] := 7;
  a[1][0] := 3; a[1][1] := 6; a[1][2] := 9;

  c^ := a^;

  Print(c^); 
  CopyPrint(a^);
  Print(a^)
END tFlex4.

(*[[
!! SYMFILE #tFlex4 STAMP #tFlex4.%main 1
!! END STAMP
!! 
MODULE tFlex4 STAMP 0
IMPORT Out STAMP
ENDHDR

PROC tFlex4.Print 4 5 0x00100001
! PROCEDURE Print(VAR m: Matrix);
!   FOR i := 0 TO LEN(m, 1)-1 DO
LDLW 16
DEC
STLW -12
CONST 0
STLW -4
JUMP 2
LABEL 1
!     FOR j := 0 TO LEN(m, 2)-1 DO
LDLW 20
DEC
STLW -16
CONST 0
STLW -8
JUMP 4
LABEL 3
!       Out.Int(m[i,j], 3)
CONST 3
LDLW 12
LDLW -4
LDLW 16
BOUND 21
LDLW 20
TIMES
LDLW -8
LDLW 20
BOUND 21
PLUS
LDIW
GLOBAL Out.Int
CALL 2
!     FOR j := 0 TO LEN(m, 2)-1 DO
INCL -8
LABEL 4
LDLW -8
LDLW -16
JLEQ 3
!   FOR i := 0 TO LEN(m, 1)-1 DO
INCL -4
LABEL 2
LDLW -4
LDLW -12
JLEQ 1
!   Out.Ln
GLOBAL Out.Ln
CALL 0
RETURN
END

PROC tFlex4.CopyPrint 1 11 0x00110001
! PROCEDURE CopyPrint(VAR m: Matrix);
!   NEW(mm, LEN(m, 1), LEN(m, 2));
LDLW 20
LDLW 16
CONST 2
CONST 4
CONST 0
LOCAL -4
GLOBAL NEWFLEX
CALL 6
!   mm^ := m;
LDLW -4
NCHECK 31
DUP 0
LDNW -4
LDNW 8
SWAP
DUP 0
LDNW -4
LDNW 4
SWAP
LDLW 20
LDLW 16
LDLW 12
CONST 2
CONST 4
GLOBAL FLEXASSIGN
CALL 6
!   Print(mm^);
LDLW -4
NCHECK 32
DUP 0
LDNW -4
LDNW 8
SWAP
DUP 0
LDNW -4
LDNW 4
SWAP
GLOBAL tFlex4.Print
CALL 3
!   mm[1][1] := 8;
CONST 8
LDLW -4
NCHECK 33
CONST 1
DUP 1
LDNW -4
LDNW 4
BOUND 33
DUP 1
LDNW -4
LDNW 8
TIMES
CONST 1
DUP 2
LDNW -4
LDNW 8
BOUND 33
PLUS
STIW
!   m := mm^
LDLW 20
LDLW 16
LDLW 12
LDLW -4
NCHECK 34
DUP 0
LDNW -4
LDNW 8
SWAP
DUP 0
LDNW -4
LDNW 4
SWAP
CONST 2
CONST 4
GLOBAL FLEXASSIGN
CALL 6
RETURN
END

PROC tFlex4.%main 0 11 0
!   NEW(a, 2, 3); NEW(c, 2, 3);
CONST 3
CONST 2
CONST 2
CONST 4
CONST 0
GLOBAL tFlex4.a
GLOBAL NEWFLEX
CALL 6
CONST 3
CONST 2
CONST 2
CONST 4
CONST 0
GLOBAL tFlex4.c
GLOBAL NEWFLEX
CALL 6
!   a[0][0] := 2; a[0][1] := 4; a[0][2] := 7;
CONST 2
LDGW tFlex4.a
NCHECK 40
CONST 0
DUP 1
LDNW -4
LDNW 4
BOUND 40
DUP 1
LDNW -4
LDNW 8
TIMES
CONST 0
DUP 2
LDNW -4
LDNW 8
BOUND 40
PLUS
STIW
CONST 4
LDGW tFlex4.a
NCHECK 40
CONST 0
DUP 1
LDNW -4
LDNW 4
BOUND 40
DUP 1
LDNW -4
LDNW 8
TIMES
CONST 1
DUP 2
LDNW -4
LDNW 8
BOUND 40
PLUS
STIW
CONST 7
LDGW tFlex4.a
NCHECK 40
CONST 0
DUP 1
LDNW -4
LDNW 4
BOUND 40
DUP 1
LDNW -4
LDNW 8
TIMES
CONST 2
DUP 2
LDNW -4
LDNW 8
BOUND 40
PLUS
STIW
!   a[1][0] := 3; a[1][1] := 6; a[1][2] := 9;
CONST 3
LDGW tFlex4.a
NCHECK 41
CONST 1
DUP 1
LDNW -4
LDNW 4
BOUND 41
DUP 1
LDNW -4
LDNW 8
TIMES
CONST 0
DUP 2
LDNW -4
LDNW 8
BOUND 41
PLUS
STIW
CONST 6
LDGW tFlex4.a
NCHECK 41
CONST 1
DUP 1
LDNW -4
LDNW 4
BOUND 41
DUP 1
LDNW -4
LDNW 8
TIMES
CONST 1
DUP 2
LDNW -4
LDNW 8
BOUND 41
PLUS
STIW
CONST 9
LDGW tFlex4.a
NCHECK 41
CONST 1
DUP 1
LDNW -4
LDNW 4
BOUND 41
DUP 1
LDNW -4
LDNW 8
TIMES
CONST 2
DUP 2
LDNW -4
LDNW 8
BOUND 41
PLUS
STIW
!   c^ := a^;
LDGW tFlex4.c
NCHECK 43
DUP 0
LDNW -4
LDNW 8
SWAP
DUP 0
LDNW -4
LDNW 4
SWAP
LDGW tFlex4.a
NCHECK 43
DUP 0
LDNW -4
LDNW 8
SWAP
DUP 0
LDNW -4
LDNW 4
SWAP
CONST 2
CONST 4
GLOBAL FLEXASSIGN
CALL 6
!   Print(c^); 
LDGW tFlex4.c
NCHECK 45
DUP 0
LDNW -4
LDNW 8
SWAP
DUP 0
LDNW -4
LDNW 4
SWAP
GLOBAL tFlex4.Print
CALL 3
!   CopyPrint(a^);
LDGW tFlex4.a
NCHECK 46
DUP 0
LDNW -4
LDNW 8
SWAP
DUP 0
LDNW -4
LDNW 4
SWAP
GLOBAL tFlex4.CopyPrint
CALL 3
!   Print(a^)
LDGW tFlex4.a
NCHECK 47
DUP 0
LDNW -4
LDNW 8
SWAP
DUP 0
LDNW -4
LDNW 4
SWAP
GLOBAL tFlex4.Print
CALL 3
RETURN
END

! Global variables
GLOVAR tFlex4.a 4
GLOVAR tFlex4.c 4

! Pointer map
DEFINE tFlex4.%gcmap
WORD GC_BASE
WORD tFlex4.a
WORD 0
WORD GC_BASE
WORD tFlex4.c
WORD 0
WORD GC_END

! End of file
]]*)
