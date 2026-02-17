-- =============================================
-- Test 08 – 340 Varones entre 20 y 30 años
-- Tipo: Prueba de Naturaleza
-- =============================================

-- Reiniciar entorno
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE tbb_pacientes;
TRUNCATE TABLE tbb_personas_fisicas;
TRUNCATE TABLE tbb_personas;

SET FOREIGN_KEY_CHECKS = 1;

-- Ejecutar procedimiento
CALL sp_poblar_pacientes_goog(
    340,
    'H',      -- sexo masculino
    NULL,
    20,       -- edad mínima
    30,       -- edad máxima
    NULL,
    NULL
);

-- Validación total
SELECT COUNT(*) AS total_pacientes
FROM tbb_pacientes;

-- Validación por sexo
SELECT genero, COUNT(*) 
FROM tbb_personas_fisicas
GROUP BY genero;

-- Validación por edad
SELECT 
    MIN(edad) AS edad_minima,
    MAX(edad) AS edad_maxima
FROM tbb_personas_fisicas;
