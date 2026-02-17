# Test 10 – 2200 Pacientes Vivos

## Tipo de Prueba
Prueba de Naturaleza

## Objetivo
Validar que el procedimiento permita generar
2200 pacientes con estatus de vida "Vivo".

## Preparación del Entorno
Se limpiaron las tablas antes de la ejecución
para garantizar independencia de la prueba.

## Script Ejecutado

CALL sp_poblar_pacientes_goog(
    2200,
    NULL,
    NULL,
    NULL,
    'Vivo',
    NULL,
    NULL
);

## Validación Realizada
- Conteo total de pacientes.
- Agrupación por estatus de vida.

## Resultado Esperado
- 2200 registros insertados.
- Todos con estatus de vida "Vivo".

## Resultado Obtenido
La prueba fue exitosa.
Todos los registros generados corresponden
al estatus de vida "Vivo".

## Evidencia
Ver archivo `test10.png`.

## Observaciones
El procedimiento respetó correctamente
el parámetro de estatus de vida.
