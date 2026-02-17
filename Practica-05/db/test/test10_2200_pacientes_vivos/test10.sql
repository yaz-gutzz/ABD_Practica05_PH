-- =============================================
-- Test 10 – 2200 Pacientes Vivos
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
    2200,     -- cantidad
    NULL,     -- genero
    NULL,     -- edad mínima
    NULL,     -- edad máxima
    'Vivo',   -- estatus vida
    NULL,     -- etapa vida
    NULL      -- estatus medico
);

-- Validación total
SELECT COUNT(*) AS total_pacientes
FROM tbb_pacientes;

-- Validación por estatus de vida
SELECT estatus_vida, COUNT(*) AS cantidad
FROM tbb_pacientes
GROUP BY estatus_vida;
