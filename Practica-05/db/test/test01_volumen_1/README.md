# Test 01 – Registro de 1 Paciente

## Tipo de Prueba
Prueba de Volumen

## Objetivo
Validar que el procedimiento almacenado `sp_poblar_pacientes_goog`
inserta correctamente un solo registro respetando la estructura jerárquica:

tbb_personas → tbb_personas_fisicas → tbb_pacientes

## Preparación del Entorno

Se limpiaron las tablas antes de ejecutar la prueba para garantizar
independencia y evitar acumulación de registros.

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE tbb_pacientes;
TRUNCATE TABLE tbb_personas_fisicas;
TRUNCATE TABLE tbb_personas;

SET FOREIGN_KEY_CHECKS = 1;

## Script Ejecutado

CALL sp_poblar_pacientes_goog(
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
);

## Validación Realizada

SELECT COUNT(*) AS total_pacientes FROM tbb_pacientes;

## Resultado Esperado
Se debe registrar exactamente 1 paciente en la tabla `tbb_pacientes`,
junto con su respectiva información en:

- tbb_personas
- tbb_personas_fisicas

## Resultado Obtenido
La prueba se ejecutó correctamente.
Se insertó 1 registro sin errores.

## Evidencia
Ver archivo `test01.png`

## Observaciones
La ejecución fue exitosa.
Se respetaron las reglas de negocio y la integridad referencial.
