-- =============================================
-- Test 11 – 502 Mujeres Finadas mayores de 45 años
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
    502,        -- cantidad
    'M',        -- genero femenino
    46,         -- edad mínima (mayores de 45)
    NULL,       -- edad máxima
    'Finado',   -- estatus vida
    NULL,       -- etapa vida
    NULL        -- estatus medico
);

-- Validación total
SELECT COUNT(*) AS total_pacientes
FROM tbb_pacientes;

-- Validación por género
SELECT genero, COUNT(*) AS cantidad
FROM tbb_personas_fisicas
GROUP BY genero;

-- Validación estatus vida
SELECT estatus_vida, COUNT(*) AS cantidad
FROM tbb_pacientes
GROUP BY estatus_vida;

-- Validación rango edad
SELECT 
    MIN(TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE())) AS edad_minima,
    MAX(TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE())) AS edad_maxima
FROM tbb_personas_fisicas;
