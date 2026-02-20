# Test 01 – Registro de 1 Paciente

## Tipo de prueba
Prueba de Volumen

## Objetivo
Validar que el procedimiento almacenado `sp_poblar_pacientes_goog`
inserta correctamente un paciente respetando la estructura jerárquica:

Persona → Persona Física → Paciente.

## Script ejecutado

CALL sp_poblar_pacientes_goog(
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
);

## Validación realizada

SELECT COUNT(*) FROM tbb_pacientes;

## Resultado esperado
Se incrementa en 1 el total de pacientes registrados.

## Observaciones
La ejecución fue exitosa sin errores y se respetó la integridad referencial.
