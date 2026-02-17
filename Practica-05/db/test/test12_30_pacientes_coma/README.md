# Test 12 – 30 Pacientes en Coma

## Tipo de Prueba
Prueba de Naturaleza

## Objetivo
Validar que el procedimiento permita generar
30 pacientes con estatus médico "Coma".

## Preparación del Entorno
Se limpiaron las tablas antes de la ejecución
para garantizar independencia de la prueba.

## Script Ejecutado

CALL sp_poblar_pacientes_goog(
    30,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'Coma'
);

## Validación Realizada
- Conteo total de registros.
- Agrupación por estatus médico.

## Resultado Esperado
- 30 registros insertados.
- Todos con estatus médico "Coma".

## Resultado Obtenido
La prueba fue exitosa.
Todos los registros generados corresponden
al estatus médico "Coma".

## Evidencia
Ver archivo `evidencia.png`.

## Observaciones
El procedimiento respetó correctamente
el parámetro de estatus médico.
