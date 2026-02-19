# Test 07 – 150 Mujeres

## Tipo de Prueba
Prueba de Naturaleza

## Objetivo
Validar que el procedimiento permita
generar pacientes filtrando por sexo femenino.

## Script Ejecutado

CALL sp_poblar_pacientes_goog(
    150,
    'M',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
);

## Validación Realizada

SELECT genero, COUNT(*) FROM tbb_personas_fisicas GROUP BY genero;

## Resultado Esperado
150 registros con sexo femenino (M).

## Resultado Obtenido
La prueba fue exitosa.
Todos los registros generados corresponden
al sexo femenino.

## Observaciones
El procedimiento respetó correctamente
el parámetro de filtrado por sexo.
