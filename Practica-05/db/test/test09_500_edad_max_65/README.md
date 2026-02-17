# Test 09 – 500 Pacientes edad máxima 65 años

## Tipo de Prueba
Prueba de Naturaleza

## Objetivo
Validar que el procedimiento genere
500 pacientes cuya edad no exceda los 65 años.

## Preparación del Entorno
Se limpiaron las tablas antes de la ejecución
para garantizar independencia de la prueba.

## Script Ejecutado

CALL sp_poblar_pacientes_goog(
    500,
    NULL,
    NULL,
    65,
    NULL,
    NULL,
    NULL
);

## Validación Realizada
- Conteo total de registros.
- Verificación del rango de edad calculado
  a partir de la fecha de nacimiento.

## Resultado Esperado
- 500 registros insertados.
- Edad máxima menor o igual a 65 años.

## Resultado Obtenido
La prueba fue exitosa.
Ningún paciente supera los 65 años.

## Evidencia
Ver archivo `test09.png`.

## Observaciones
El parámetro de edad máxima fue respetado correctamente.
