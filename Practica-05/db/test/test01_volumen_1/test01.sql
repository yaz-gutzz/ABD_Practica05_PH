-- =============================================
-- Test 01 – Registro de 1 Paciente
-- Tipo: Prueba de Volumen
-- =============================================

CALL sp_poblar_pacientes_goog(
    1,      -- cantidad
    NULL,   -- genero
    NULL,   -- edad_min
    NULL,   -- edad_max
    NULL,   -- estatus_vida
    NULL,   -- etapa_vida
    NULL    -- estatus_medico
);

-- Validación
SELECT COUNT(*) AS total_pacientes
FROM tbb_pacientes;
