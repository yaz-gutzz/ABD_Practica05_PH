# Test 14 – 107 Pacientes en Cuidados Paliativos

## Tipo de Prueba
Prueba de Naturaleza

## Objetivo
Validar que el procedimiento permita generar
107 pacientes con estatus médico
"Cuidados Paliativos".

## Preparación del Entorno
Se limpiaron las tablas antes de la ejecución
para garantizar independencia de la prueba.

## Script Ejecutado

CALL sp_poblar_pacientes_goog(
    107,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'Cuidados Paliativos'
);

## Validación Realizada
- Conteo total de registros.
- Agrupación por estatus médico.

## Resultado Esperado
- 107 registros insertados.
- Todos con estatus médico
  "Cuidados Paliativos".

## Resultado Obtenido
La prueba fue ejecutada y validada
según los criterios establecidos.

## Evidencia
Ver archivo `test14.png`.

## Observaciones
Se verificó que el procedimiento
respete el parámetro de estatus médico.
