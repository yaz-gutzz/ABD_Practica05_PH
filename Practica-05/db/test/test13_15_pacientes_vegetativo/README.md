# Test 13 – 15 Pacientes en estado Vegetativo

## Tipo de Prueba
Prueba de Naturaleza

## Objetivo
Validar que el procedimiento permita generar
15 pacientes con estatus médico "Vegetativo".

## Script Ejecutado

CALL sp_poblar_pacientes_goog(
    15,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'Vegetativo'
);

## Validación Realizada
- Conteo total de registros.
- Agrupación por estatus médico.

## Resultado Esperado
- 15 registros insertados.
- Todos con estatus médico "Vegetativo".

## Resultado Obtenido
La prueba fue exitosa.
Todos los registros generados corresponden
al estatus médico "Vegetativo".

## Observaciones
El procedimiento respetó correctamente
el parámetro de estatus médico.
