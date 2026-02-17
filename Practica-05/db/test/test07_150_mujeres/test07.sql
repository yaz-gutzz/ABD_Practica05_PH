-- =============================================
-- Test 07 – 150 Mujeres
-- Tipo: Prueba de Naturaleza
-- =============================================

-- Reiniciar entorno
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE tbb_pacientes;
TRUNCATE TABLE tbb_personas_fisicas;
TRUNCATE TABLE tbb_personas;

SET FOREIGN_KEY_CHECKS = 1;

-- Ejecutar procedimiento solo mujeres
CALL sp_poblar_pacientes_goog(
    150,
    'M',   
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
);


-- Validación por sexo
SELECT genero, COUNT(*) AS cantidad
FROM tbb_personas_fisicas
GROUP BY genero;
