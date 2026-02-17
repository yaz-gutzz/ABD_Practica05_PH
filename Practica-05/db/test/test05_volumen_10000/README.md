# Test 05 – Registro de 10000 Pacientes

## Tipo de Prueba
Prueba de Volumen

## Objetivo
Evaluar el rendimiento del procedimiento
`sp_poblar_pacientes_goog` ante un volumen
masivo de 10000 registros.

## Preparación del Entorno
Se reiniciaron las tablas antes de la ejecución
para garantizar independencia de la prueba.

## Script Ejecutado

CALL sp_poblar_pacientes_goog(
    10000,
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
10000 registros insertados correctamente.

## Resultado Obtenido
La prueba se ejecutó exitosamente.
Se registraron 10000 pacientes
manteniendo la integridad referencial.

## Tiempo de Ejecución
Ver resultado mostrado en la evidencia.

## Evidencia
Ver archivo `test05.png`.

## Observaciones
El procedimiento respondió adecuadamente
a un volumen elevado de datos.
