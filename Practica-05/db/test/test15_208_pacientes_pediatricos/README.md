# Test 15 – 208 Pacientes Pediátricos

## Tipo de Prueba
Prueba de Naturaleza

## Objetivo
Validar que el procedimiento permita generar
208 pacientes clasificados como pediátricos.

## Preparación del Entorno
Se limpiaron las tablas antes de la ejecución
para garantizar independencia de la prueba.

## Script Ejecutado

CALL sp_poblar_pacientes_goog(
    208,
    NULL,
    NULL,
    NULL,
    NULL,
    'Pediatrico',
    NULL
);

## Validación Realizada
- Conteo total de registros.
- Cálculo de edad mínima y máxima
  a partir de la fecha de nacimiento.

## Resultado Esperado
- 208 registros insertados.
- Edad entre 0 y 17 años.

## Resultado Obtenido
La prueba fue ejecutada correctamente.
Todos los pacientes generados
pertenecen al rango pediátrico.

## Evidencia
Ver archivo `test15.png`.

## Observaciones
La lógica interna del procedimiento
forzó correctamente el rango de edad pediátrico.
