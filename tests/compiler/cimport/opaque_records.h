#ifndef COIL_CIMPORT_OPAQUE_RECORDS_H
#define COIL_CIMPORT_OPAQUE_RECORDS_H

/* Records whose fields cimport cannot spell (an anonymous union member), so it
 * keeps each one as an opaque value of the size and alignment clang folds. The
 * gate counts clang runs: every record is folded in one run, however many there
 * are, instead of one full parse of the header per record. */

struct coil_opaque_record_0 { long long tag; union { int i; char bytes[1]; }; };
struct coil_opaque_record_1 { long long tag; union { int i; char bytes[2]; }; };
struct coil_opaque_record_2 { long long tag; union { int i; char bytes[3]; }; };
struct coil_opaque_record_3 { long long tag; union { int i; char bytes[4]; }; };
struct coil_opaque_record_4 { long long tag; union { int i; char bytes[5]; }; };
struct coil_opaque_record_5 { long long tag; union { int i; char bytes[6]; }; };
struct coil_opaque_record_6 { long long tag; union { int i; char bytes[7]; }; };
struct coil_opaque_record_7 { long long tag; union { int i; char bytes[8]; }; };
struct coil_opaque_record_8 { long long tag; union { int i; char bytes[9]; }; };
struct coil_opaque_record_9 { long long tag; union { int i; char bytes[10]; }; };
struct coil_opaque_record_10 { long long tag; union { int i; char bytes[11]; }; };
struct coil_opaque_record_11 { long long tag; union { int i; char bytes[12]; }; };
struct coil_opaque_record_12 { long long tag; union { int i; char bytes[13]; }; };
struct coil_opaque_record_13 { long long tag; union { int i; char bytes[14]; }; };
struct coil_opaque_record_14 { long long tag; union { int i; char bytes[15]; }; };
struct coil_opaque_record_15 { long long tag; union { int i; char bytes[16]; }; };
struct coil_opaque_record_16 { long long tag; union { int i; char bytes[17]; }; };
struct coil_opaque_record_17 { long long tag; union { int i; char bytes[18]; }; };
struct coil_opaque_record_18 { long long tag; union { int i; char bytes[19]; }; };
struct coil_opaque_record_19 { long long tag; union { int i; char bytes[20]; }; };
struct coil_opaque_record_20 { long long tag; union { int i; char bytes[21]; }; };
struct coil_opaque_record_21 { long long tag; union { int i; char bytes[22]; }; };
struct coil_opaque_record_22 { long long tag; union { int i; char bytes[23]; }; };
struct coil_opaque_record_23 { long long tag; union { int i; char bytes[24]; }; };

#endif
