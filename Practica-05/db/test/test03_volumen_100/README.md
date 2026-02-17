# Test 03 – Registro de 100 Pacientes

## Tipo de Prueba
Prueba de Volumen

## Objetivo
Validar la generación dinámica de 100 pacientes
mediante el procedimiento `sp_poblar_pacientes_goog`.

## Preparación del Entorno
Se limpiaron las tablas para garantizar independencia
de la prueba.

## Script Ejecutado

CALL sp_poblar_pacientes_goog(
    100,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
);

## Validación Realizada

SELECT COUNT(*) FROM tbb_pacientes;

## Resultado Esperado
100 registros insertados correctamente.

## Resultado Obtenido
La prueba fue exitosa.
Se insertaron 100 pacientes sin errores.

## Evidencia
Ver archivo `test03.png`.

## Observaciones
El procedimiento respondió correctamente
ante un volumen intermedio de datos.
