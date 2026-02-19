# Test 08 – 340 Pacientes Varones entre 20 y 30 años

## Tipo de Prueba
Prueba de Naturaleza

## Objetivo
Validar que el procedimiento permita generar
340 pacientes de género masculino
con edades entre 20 y 30 años.

## Script Ejecutado

CALL sp_poblar_pacientes_goog(
    340,
    'H',
    20,
    30,
    NULL,
    NULL,
    NULL
);

## Validación Realizada
- Conteo total de pacientes.
- Verificación del género generado.
- Cálculo de edad mínima y máxima
  a partir de la fecha de nacimiento.

## Resultado Esperado
- 340 registros insertados.
- Todos de género masculino.
- Edad entre 20 y 30 años.

## Resultado Obtenido
La prueba se ejecutó exitosamente.
Se generaron 340 pacientes varones
respetando el rango de edad establecido.

## Observaciones
El procedimiento respetó simultáneamente
los parámetros de género y rango de edad.
