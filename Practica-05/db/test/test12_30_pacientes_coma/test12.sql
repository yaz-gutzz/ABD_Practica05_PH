-- =============================================
-- Test 12 – 30 Pacientes en Coma
-- Tipo: Prueba de Naturaleza
-- =============================================

-- Reiniciar entorno
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE tbb_pacientes;
TRUNCATE TABLE tbb_personas_fisicas;
TRUNCATE TABLE tbb_personas;

SET FOREIGN_KEY_CHECKS = 1;

-- Ejecución del procedimiento
CALL sp_poblar_pacientes_goog(
    30,        -- cantidad
    NULL,      -- genero
    NULL,      -- edad mínima
    NULL,      -- edad máxima
    NULL,      -- estatus vida
    NULL,      -- etapa vida
    'Coma'     -- estatus medico
);

-- Validación total
SELECT COUNT(*) AS total_pacientes
FROM tbb_pacientes;

-- Validación por estatus medico
SELECT estatus_medico, COUNT(*) AS cantidad
FROM tbb_pacientes
GROUP BY estatus_medico;
