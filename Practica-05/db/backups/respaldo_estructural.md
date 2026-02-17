# Respaldo Estructural

Esta sección describe el propósito y contenido de cada archivo de respaldo incluido en el proyecto.

---


###  Descripción
Contiene exclusivamente la estructura de la base de datos sin datos almacenados.

### Incluye
- Creación de la base de datos.
- Tablas.
- Llaves primarias.
- Llaves foráneas.
- Índices.
- Restricciones (NOT NULL, UNIQUE, etc.).
- Procedimientos almacenados (si fueron incluidos en la exportación estructural).

###  Objetivo
Permitir reconstruir la arquitectura completa de la base de datos desde cero.

###  Cuándo usarlo
- Cuando se necesita recrear la base sin información.
- Antes de insertar nuevos datos.
- Para migrar el modelo a otro servidor.

---
