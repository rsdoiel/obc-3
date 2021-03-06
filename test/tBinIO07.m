MODULE tBinIO07;

IMPORT Files, Out;

PROCEDURE Copy(VAR src, dst: ARRAY OF ARRAY OF INTEGER);
  VAR i, j: INTEGER;
BEGIN
  FOR i := 0 TO LEN(dst, 0) - 1 DO
    FOR j := 0 TO LEN(dst, 1) - 1 DO
      dst[i][j] := src[i][j]
    END
  END
END Copy;

PROCEDURE WriteBin(f: Files.File; VAR x: ARRAY OF ARRAY OF INTEGER);
BEGIN
  Files.Write(f, x)
END WriteBin;

PROCEDURE ReadBin(f: Files.File; VAR x: ARRAY OF ARRAY OF INTEGER);
BEGIN
  Files.Read(f, x)
END ReadBin;

VAR 
  i, j: INTEGER; 
  a, b: ARRAY 2 OF INTEGER;
  c, d: ARRAY 2 OF ARRAY 2 OF INTEGER;
  p, q: POINTER TO ARRAY OF ARRAY OF INTEGER;
  f: Files.File;

BEGIN
  i := 12345678; a[0] := 23456789; a[1] := 34567890;
  c[0][0] := 45678901; c[0][1] := 56789012;
  c[1][0] := 67890123; c[1][1] := 78901234;
  f := Files.Open("data", "wb");
  Files.Write(f, i);
  Files.Write(f, a);
  WriteBin(f, c);
  NEW(p, 2, 2); Copy(c, p^); WriteBin(f, p^);
  Out.Int(Files.Tell(f), 0); Out.Ln;
  Files.Close(f);

  f := Files.Open("data", "rb");
  Files.Read(f, j);
  Files.Read(f, b);
  Out.Int(j, 10); Out.Int(b[0], 10); Out.Int(b[1], 10); Out.Ln;
  ReadBin(f, d);
  Out.Int(d[0][0], 10); Out.Int(d[0][1], 10); 
  Out.Int(d[1][0], 10); Out.Int(d[1][1], 10); Out.Ln;
  NEW(q, 2, 2); ReadBin(f, q^);
  Out.Int(q[0][0], 10); Out.Int(q[0][1], 10); 
  Out.Int(q[1][0], 10); Out.Int(q[1][1], 10); Out.Ln;
END tBinIO07.

(*<<
44
  12345678  23456789  34567890
  45678901  56789012  67890123  78901234
  45678901  56789012  67890123  78901234
>>*)

(*[[
!! (SYMFILE #tBinIO07 STAMP #tBinIO07.%main 1 #tBinIO07.m)
!! (CHKSUM STAMP)
!! 
MODULE tBinIO07 STAMP 0
IMPORT Files STAMP
IMPORT Out STAMP
ENDHDR

PROC tBinIO07.Copy 16 5 0x00900001
! PROCEDURE Copy(VAR src, dst: ARRAY OF ARRAY OF INTEGER);
!   FOR i := 0 TO LEN(dst, 0) - 1 DO
LDLW 28
DEC
STLW -12
CONST 0
STLW -4
LABEL L4
LDLW -4
LDLW -12
JGT L5
!     FOR j := 0 TO LEN(dst, 1) - 1 DO
LDLW 32
DEC
STLW -16
CONST 0
STLW -8
LABEL L6
LDLW -8
LDLW -16
JGT L7
!       dst[i][j] := src[i][j]
LDLW 12
LDLW -4
LDLW 16
BOUND 10
LDLW 20
TIMES
LDLW -8
LDLW 20
BOUND 10
PLUS
LDIW
LDLW 24
LDLW -4
LDLW 28
BOUND 10
LDLW 32
TIMES
LDLW -8
LDLW 32
BOUND 10
PLUS
STIW
!     FOR j := 0 TO LEN(dst, 1) - 1 DO
INCL -8
JUMP L6
LABEL L7
!   FOR i := 0 TO LEN(dst, 0) - 1 DO
INCL -4
JUMP L4
LABEL L5
RETURN
END

PROC tBinIO07.WriteBin 0 4 0x00300001
! PROCEDURE WriteBin(f: Files.File; VAR x: ARRAY OF ARRAY OF INTEGER);
!   Files.Write(f, x)
LDLW 16
CONST 4
LDLW 20
TIMES
LDLW 24
TIMES
SWAP
LDLW 12
GLOBAL Files.Write
CALL 3
RETURN
END

PROC tBinIO07.ReadBin 0 4 0x00300001
! PROCEDURE ReadBin(f: Files.File; VAR x: ARRAY OF ARRAY OF INTEGER);
!   Files.Read(f, x)
LDLW 16
CONST 4
LDLW 20
TIMES
LDLW 24
TIMES
SWAP
LDLW 12
GLOBAL Files.Read
CALL 3
RETURN
END

PROC tBinIO07.%main 0 7 0
!   i := 12345678; a[0] := 23456789; a[1] := 34567890;
CONST 12345678
STGW tBinIO07.i
CONST 23456789
STGW tBinIO07.a
CONST 34567890
GLOBAL tBinIO07.a
STNW 4
!   c[0][0] := 45678901; c[0][1] := 56789012;
CONST 45678901
STGW tBinIO07.c
CONST 56789012
GLOBAL tBinIO07.c
STNW 4
!   c[1][0] := 67890123; c[1][1] := 78901234;
CONST 67890123
GLOBAL tBinIO07.c
STNW 8
CONST 78901234
GLOBAL tBinIO07.c
STNW 12
!   f := Files.Open("data", "wb");
CONST 3
GLOBAL tBinIO07.%2
CONST 5
GLOBAL tBinIO07.%1
GLOBAL Files.Open
CALLW 4
STGW tBinIO07.f
!   Files.Write(f, i);
CONST 4
GLOBAL tBinIO07.i
LDGW tBinIO07.f
GLOBAL Files.Write
CALL 3
!   Files.Write(f, a);
CONST 8
GLOBAL tBinIO07.a
LDGW tBinIO07.f
GLOBAL Files.Write
CALL 3
!   WriteBin(f, c);
CONST 2
CONST 2
GLOBAL tBinIO07.c
LDGW tBinIO07.f
GLOBAL tBinIO07.WriteBin
CALL 4
!   NEW(p, 2, 2); Copy(c, p^); WriteBin(f, p^);
CONST 2
CONST 2
CONST 2
CONST 4
CONST 0
GLOBAL NEWFLEX
CALLW 5
STGW tBinIO07.p
LDGW tBinIO07.p
NCHECK 40
DUP 0
LDNW -4
LDNW 8
SWAP
DUP 0
LDNW -4
LDNW 4
SWAP
CONST 2
CONST 2
GLOBAL tBinIO07.c
GLOBAL tBinIO07.Copy
CALL 6
LDGW tBinIO07.p
NCHECK 40
DUP 0
LDNW -4
LDNW 8
SWAP
DUP 0
LDNW -4
LDNW 4
SWAP
LDGW tBinIO07.f
GLOBAL tBinIO07.WriteBin
CALL 4
!   Out.Int(Files.Tell(f), 0); Out.Ln;
CONST 0
LDGW tBinIO07.f
GLOBAL Files.Tell
CALLW 1
GLOBAL Out.Int
CALL 2
GLOBAL Out.Ln
CALL 0
!   Files.Close(f);
LDGW tBinIO07.f
GLOBAL Files.Close
CALL 1
!   f := Files.Open("data", "rb");
CONST 3
GLOBAL tBinIO07.%3
CONST 5
GLOBAL tBinIO07.%1
GLOBAL Files.Open
CALLW 4
STGW tBinIO07.f
!   Files.Read(f, j);
CONST 4
GLOBAL tBinIO07.j
LDGW tBinIO07.f
GLOBAL Files.Read
CALL 3
!   Files.Read(f, b);
CONST 8
GLOBAL tBinIO07.b
LDGW tBinIO07.f
GLOBAL Files.Read
CALL 3
!   Out.Int(j, 10); Out.Int(b[0], 10); Out.Int(b[1], 10); Out.Ln;
CONST 10
LDGW tBinIO07.j
GLOBAL Out.Int
CALL 2
CONST 10
LDGW tBinIO07.b
GLOBAL Out.Int
CALL 2
CONST 10
GLOBAL tBinIO07.b
LDNW 4
GLOBAL Out.Int
CALL 2
GLOBAL Out.Ln
CALL 0
!   ReadBin(f, d);
CONST 2
CONST 2
GLOBAL tBinIO07.d
LDGW tBinIO07.f
GLOBAL tBinIO07.ReadBin
CALL 4
!   Out.Int(d[0][0], 10); Out.Int(d[0][1], 10); 
CONST 10
LDGW tBinIO07.d
GLOBAL Out.Int
CALL 2
CONST 10
GLOBAL tBinIO07.d
LDNW 4
GLOBAL Out.Int
CALL 2
!   Out.Int(d[1][0], 10); Out.Int(d[1][1], 10); Out.Ln;
CONST 10
GLOBAL tBinIO07.d
LDNW 8
GLOBAL Out.Int
CALL 2
CONST 10
GLOBAL tBinIO07.d
LDNW 12
GLOBAL Out.Int
CALL 2
GLOBAL Out.Ln
CALL 0
!   NEW(q, 2, 2); ReadBin(f, q^);
CONST 2
CONST 2
CONST 2
CONST 4
CONST 0
GLOBAL NEWFLEX
CALLW 5
STGW tBinIO07.q
LDGW tBinIO07.q
NCHECK 51
DUP 0
LDNW -4
LDNW 8
SWAP
DUP 0
LDNW -4
LDNW 4
SWAP
LDGW tBinIO07.f
GLOBAL tBinIO07.ReadBin
CALL 4
!   Out.Int(q[0][0], 10); Out.Int(q[0][1], 10); 
CONST 10
LDGW tBinIO07.q
NCHECK 52
CONST 0
DUP 1
LDNW -4
LDNW 4
BOUND 52
DUP 1
LDNW -4
LDNW 8
TIMES
CONST 0
DUP 2
LDNW -4
LDNW 8
BOUND 52
PLUS
LDIW
GLOBAL Out.Int
CALL 2
CONST 10
LDGW tBinIO07.q
NCHECK 52
CONST 0
DUP 1
LDNW -4
LDNW 4
BOUND 52
DUP 1
LDNW -4
LDNW 8
TIMES
CONST 1
DUP 2
LDNW -4
LDNW 8
BOUND 52
PLUS
LDIW
GLOBAL Out.Int
CALL 2
!   Out.Int(q[1][0], 10); Out.Int(q[1][1], 10); Out.Ln;
CONST 10
LDGW tBinIO07.q
NCHECK 53
CONST 1
DUP 1
LDNW -4
LDNW 4
BOUND 53
DUP 1
LDNW -4
LDNW 8
TIMES
CONST 0
DUP 2
LDNW -4
LDNW 8
BOUND 53
PLUS
LDIW
GLOBAL Out.Int
CALL 2
CONST 10
LDGW tBinIO07.q
NCHECK 53
CONST 1
DUP 1
LDNW -4
LDNW 4
BOUND 53
DUP 1
LDNW -4
LDNW 8
TIMES
CONST 1
DUP 2
LDNW -4
LDNW 8
BOUND 53
PLUS
LDIW
GLOBAL Out.Int
CALL 2
GLOBAL Out.Ln
CALL 0
RETURN
END

! Global variables
GLOVAR tBinIO07.i 4
GLOVAR tBinIO07.j 4
GLOVAR tBinIO07.a 8
GLOVAR tBinIO07.b 8
GLOVAR tBinIO07.c 16
GLOVAR tBinIO07.d 16
GLOVAR tBinIO07.p 4
GLOVAR tBinIO07.q 4
GLOVAR tBinIO07.f 4

! Global pointer map
DEFINE tBinIO07.%gcmap
WORD GC_POINTER
WORD tBinIO07.p
WORD GC_POINTER
WORD tBinIO07.q
WORD GC_POINTER
WORD tBinIO07.f
WORD GC_END

! String "data"
DEFINE tBinIO07.%1
STRING 6461746100

! String "wb"
DEFINE tBinIO07.%2
STRING 776200

! String "rb"
DEFINE tBinIO07.%3
STRING 726200

! End of file
]]*)
