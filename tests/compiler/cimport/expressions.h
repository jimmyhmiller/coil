#ifndef COIL_CIMPORT_EXPRESSIONS_H
#define COIL_CIMPORT_EXPRESSIONS_H

#define COIL_BASE_OPTION 0x100
#define COIL_ALIAS_OPTION COIL_BASE_OPTION
#define COIL_OR_OPTION (COIL_BASE_OPTION | 4)
#define COIL_CAST_OPTION ((int)0x200)

struct coil_fixed_array {
  unsigned char bytes[37];
};

struct coil_uninspectable {
  void (*callback)(void *);
  long state;
};

#endif
