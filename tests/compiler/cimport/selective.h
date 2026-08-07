#ifndef COIL_CIMPORT_SELECTIVE_H
#define COIL_CIMPORT_SELECTIVE_H

#define COIL_SELECTED_VALUE 41
#define COIL_UNSELECTED_VALUE 99

int coil_selected_call(int fixed, ...);
int coil_unselected_call(long value);

#endif
