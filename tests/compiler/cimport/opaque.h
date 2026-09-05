#ifndef COIL_CIMPORT_OPAQUE_H
#define COIL_CIMPORT_OPAQUE_H

typedef struct coil_opaque_session coil_opaque_session;

coil_opaque_session *coil_opaque_session_create(void);
void coil_opaque_session_destroy(coil_opaque_session *session);

#endif
