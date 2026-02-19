# Test 04 – Registro de 1000 Pacientes

## Tipo de Prueba
Prueba de Volumen

## Objetivo
Evaluar el rendimiento del procedimiento
`sp_poblar_pacientes_goog` al generar 1000 registros.

## Script Ejecutado

CALL sp_poblar_pacientes_goog(
    1000,
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
1000 registros insertados correctamente.

## Resultado Obtenido
La prueba fue exitosa.
Se insertaron 1000 pacientes respetando
la integridad referencial.

## Tiempo de Ejecución
Ver resultado mostrado en la evidencia.


## Observaciones
El procedimiento mantuvo estabilidad
ante un volumen alto de registros.
