-- =============================================
-- Test 04 – Registro de 1000 Pacientes
-- Tipo: Prueba de Volumen
-- =============================================

-- Reiniciar entorno
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE tbb_pacientes;
TRUNCATE TABLE tbb_personas_fisicas;
TRUNCATE TABLE tbb_personas;

SET FOREIGN_KEY_CHECKS = 1;

-- Medir tiempo de ejecución
SET @inicio = NOW();

CALL sp_poblar_pacientes_goog(
    1000,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
);

SET @fin = NOW();

-- Validación
SELECT COUNT(*) AS total_pacientes
FROM tbb_pacientes;
