# Test 06 – Registro de 1,000,000 Pacientes

## Tipo de Prueba
Prueba de Volumen

## Objetivo
Evaluar la capacidad del procedimiento
`sp_poblar_pacientes_goog` para generar
1,000,000 registros de manera eficiente
y manteniendo la integridad referencial.

## Script Ejecutado

CALL sp_poblar_pacientes_goog(
    1000000,
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
1,000,000 registros insertados correctamente.

## Resultado Obtenido
La prueba se ejecutó exitosamente.
Se registraron 1,000,000 pacientes
sin violaciones de integridad referencial.


## Observaciones
El uso de transacciones por lotes (batch_size = 5000)
permitió mantener estabilidad durante la inserción masiva.
