#ifndef COIL_CIMPORT_EXPRESSIONS_H
#define COIL_CIMPORT_EXPRESSIONS_H

#define COIL_BASE_OPTION 0x100
#define COIL_ALIAS_OPTION COIL_BASE_OPTION
#define COIL_OR_OPTION (COIL_BASE_OPTION | 4)
#define COIL_CAST_OPTION ((int)0x200)

/* A macro binds by its C type: a pointer, a function pointer among them, as a
   typed def; a floating-point expression not at all, rather than as an integer. */
typedef void (*coil_handler)(int);
#define COIL_HANDLER_IGNORE ((coil_handler)1)
#define COIL_NO_TEXT ((const char *)0)
#define COIL_HALF (1.0 / 2)

struct coil_fixed_array {
  unsigned char bytes[37];
};

#include <stdarg.h>

/* Function pointers in every C spelling: a field, an array of them, a parameter,
   a return value, and a pointer to a function returning a pointer to a function. */
typedef void (*coil_trace_callback)(int level, const char *text, va_list args);

struct coil_callbacks {
  void (*callback)(void *);
  void (*table[4])(int);
  int (*(*chain)(char))(double);
  long state;
};

void coil_set_trace(coil_trace_callback cb);
void coil_set_loader(unsigned char *(*loader)(const char *, int *));
unsigned char *(*coil_get_loader(void))(const char *, int *);

/* Still opaque: an anonymous union member has no field name to bind. */
struct coil_uninspectable {
  union { int whole; float real; };
  long state;
};

/* The most negative 64-bit value, written as a literal and reached through
   <stdint.h>: its magnitude alone does not fit an i64. */
#include <stdint.h>
#define COIL_MOST_NEGATIVE -9223372036854775808
#define COIL_INT64_MIN INT64_MIN

/* -9999999999 is a value like any other. */
#define COIL_ONCE_A_SENTINEL -9999999999
enum coil_wide { COIL_WIDE_NEGATIVE = -9999999999LL };

/* Names that merely contain a qualifier word are names. */
typedef int coil_constant_t;
coil_constant_t coil_get_constant(void);
struct coil_restricted_area { int x; };
void coil_use_area(const struct coil_restricted_area *restrict area);

#endif
