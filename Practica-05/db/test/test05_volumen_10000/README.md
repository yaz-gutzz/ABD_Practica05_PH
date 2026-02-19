# Test 05 – Registro de 10000 Pacientes

## Tipo de Prueba
Prueba de Volumen

## Objetivo
Evaluar el rendimiento del procedimiento
`sp_poblar_pacientes_goog` ante un volumen
masivo de 10000 registros.

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


## Observaciones
El procedimiento respondió adecuadamente
a un volumen elevado de datos.
