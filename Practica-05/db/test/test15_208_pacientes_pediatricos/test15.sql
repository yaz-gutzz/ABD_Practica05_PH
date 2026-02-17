-- =============================================
-- Test 15 – 208 Pacientes Pediátricos
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
    208,           -- cantidad
    NULL,          -- genero
    NULL,          -- edad mínima (lo fuerza el SP)
    NULL,          -- edad máxima (lo fuerza el SP)
    NULL,          -- estatus vida
    'Pediatrico',  -- etapa vida
    NULL           -- estatus medico
);

-- Validación total
SELECT COUNT(*) AS total_pacientes
FROM tbb_pacientes;

-- Validación rango edad
SELECT 
    MIN(TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE())) AS edad_minima,
    MAX(TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE())) AS edad_maxima
FROM tbb_personas_fisicas;
