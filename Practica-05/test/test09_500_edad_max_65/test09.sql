-- =============================================
-- Test 09 – 500 Pacientes edad máxima 65 años
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
    500,      -- cantidad
    NULL,     -- genero
    NULL,     -- edad mínima
    65,       -- edad máxima
    NULL,     -- estatus vida
    NULL,     -- etapa vida
    NULL      -- estatus medico
);

-- Validación total
SELECT COUNT(*) AS total_pacientes
FROM tbb_pacientes;


-- Validación rango de edad
SELECT 
    MIN(TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE())) AS edad_minima,
    MAX(TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE())) AS edad_maxima
FROM tbb_personas_fisicas;
