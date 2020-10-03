MODULE tBigStr07;

(*<<
301
1350
>>*)

IMPORT Out, Strings;

CONST s =
"012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789";

VAR i, sum: INTEGER;

BEGIN
  Out.Int(LEN(s), 0); Out.Ln;

  sum := 0;
  FOR i := 0 TO Strings.Length(s)-1 DO
    sum := sum + ORD(s[i]) - ORD('0')
  END;
  Out.Int(sum, 0); Out.Ln
END tBigStr07.

(*[[
!! (SYMFILE #tBigStr07 STAMP #tBigStr07.%main 1 #tBigStr07.m)
!! (CHKSUM STAMP)
!! 
MODULE tBigStr07 STAMP 0
IMPORT Out STAMP
IMPORT Strings STAMP
ENDHDR

PROC tBigStr07.%main 4 4 0
!   Out.Int(LEN(s), 0); Out.Ln;
CONST 0
CONST 301
GLOBAL Out.Int
CALL 2
GLOBAL Out.Ln
CALL 0
!   sum := 0;
CONST 0
STGW tBigStr07.sum
!   FOR i := 0 TO Strings.Length(s)-1 DO
CONST 301
GLOBAL tBigStr07.%1
GLOBAL Strings.Length
CALLW 2
DEC
STLW -4
CONST 0
STGW tBigStr07.i
LABEL L2
LDGW tBigStr07.i
LDLW -4
JGT L3
!     sum := sum + ORD(s[i]) - ORD('0')
LDGW tBigStr07.sum
GLOBAL tBigStr07.%1
LDGW tBigStr07.i
CONST 301
BOUND 20
LDIC
PLUS
CONST 48
MINUS
STGW tBigStr07.sum
!   FOR i := 0 TO Strings.Length(s)-1 DO
LDGW tBigStr07.i
INC
STGW tBigStr07.i
JUMP L2
LABEL L3
!   Out.Int(sum, 0); Out.Ln
CONST 0
LDGW tBigStr07.sum
GLOBAL Out.Int
CALL 2
GLOBAL Out.Ln
CALL 0
RETURN
END

! Global variables
GLOVAR tBigStr07.i 4
GLOVAR tBigStr07.sum 4

! String "012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789"
DEFINE tBigStr07.%1
STRING 3031323334353637383930313233343536373839303132333435363738393031
STRING 3233343536373839303132333435363738393031323334353637383930313233
STRING 3435363738393031323334353637383930313233343536373839303132333435
STRING 3637383930313233343536373839303132333435363738393031323334353637
STRING 3839303132333435363738393031323334353637383930313233343536373839
STRING 3031323334353637383930313233343536373839303132333435363738393031
STRING 3233343536373839303132333435363738393031323334353637383930313233
STRING 3435363738393031323334353637383930313233343536373839303132333435
STRING 3637383930313233343536373839303132333435363738393031323334353637
STRING 38393031323334353637383900

! End of file
]]*)
