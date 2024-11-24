/// @desc Evento Clean up do objeto de pausa
if (surface_exists(pausa_superf)) surface_free(pausa_superf);
if (buffer_exists(pausa_superf_buffer)) buffer_delete(pausa_superf_buffer);
