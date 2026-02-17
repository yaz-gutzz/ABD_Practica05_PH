# Test 04 – Registro de 1000 Pacientes

## Tipo de Prueba
Prueba de Volumen

## Objetivo
Evaluar el rendimiento del procedimiento
`sp_poblar_pacientes_goog` al generar 1000 registros.

## Preparación del Entorno
Se limpiaron las tablas antes de la ejecución
para garantizar independencia.

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

## Evidencia
Ver archivo `test04.png`.

## Observaciones
El procedimiento mantuvo estabilidad
ante un volumen alto de registros.
