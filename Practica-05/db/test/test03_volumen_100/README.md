# Test 03 – Registro de 100 Pacientes

## Tipo de Prueba
Prueba de Volumen

## Objetivo
Validar la generación dinámica de 100 pacientes
mediante el procedimiento `sp_poblar_pacientes_goog`.

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


## Observaciones
El procedimiento respondió correctamente
ante un volumen intermedio de datos.
