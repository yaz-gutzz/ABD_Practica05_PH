-- =============================================
-- Test 02 – Registro de 10 Pacientes
-- Tipo: Prueba de Volumen
-- =============================================

-- Reiniciar entorno
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE tbb_pacientes;
TRUNCATE TABLE tbb_personas_fisicas;
TRUNCATE TABLE tbb_personas;

SET FOREIGN_KEY_CHECKS = 1;

-- Ejecutar procedimiento
CALL sp_poblar_pacientes_goog(
    10,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
);

-- Validación
SELECT COUNT(*) AS total_pacientes
FROM tbb_pacientes;
