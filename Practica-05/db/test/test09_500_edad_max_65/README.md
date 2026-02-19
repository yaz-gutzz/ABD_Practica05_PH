# Test 09 – 500 Pacientes edad máxima 65 años

## Tipo de Prueba
Prueba de Naturaleza

## Objetivo
Validar que el procedimiento genere
500 pacientes cuya edad no exceda los 65 años.

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

## Observaciones
El parámetro de edad máxima fue respetado correctamente.
