# Test 02 – Registro de 10 Pacientes

## Tipo de Prueba
Prueba de Volumen

## Objetivo
Validar que el procedimiento `sp_poblar_pacientes_goog`
inserta correctamente 10 registros respetando la
estructura jerárquica de las tablas relacionadas.

## Preparación del Entorno

Se limpiaron las tablas antes de ejecutar la prueba
para garantizar independencia.

## Script Ejecutado

CALL sp_poblar_pacientes_goog(
    10,
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
10 registros en la tabla `tbb_pacientes`.

## Resultado Obtenido
Se registraron correctamente 10 pacientes sin errores.

## Evidencia
Ver archivo `test02.png`.

## Observaciones
La prueba se ejecutó de manera exitosa y
se mantuvo la integridad referencial.
