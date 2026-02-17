## ⚙️ Rutinas SQL  
### Funciones y Procedimientos Almacenados

El contenido documenta un conjunto de **funciones SQL** y **procedimientos almacenados** utilizados para la **generación automática de datos** dentro de un sistema de base de datos.

La lógica principal se concentra en un **procedimiento almacenado central**, el cual se apoya en diversas **funciones auxiliares** para construir información coherente y consistente antes de insertar los registros en las tablas correspondientes.

El enfoque del proyecto es **general y demostrativo**, mostrando el uso correcto de rutinas SQL para:
- Automatizar procesos
- Centralizar la lógica de negocio
- Mantener integridad y reutilización del código


## ⚙️ Rutinas Implementadas

### 🔧 Funciones SQL

Las funciones fueron creadas como **apoyo al procedimiento principal**, encargándose de generar valores específicos que son utilizados durante la población de datos.

Entre las funciones implementadas se encuentran:

1. Generación de nombre y apellido  
2. Generación de RFC y CURP  
3. Generación de edad y género  
4. Generación de grupo sanguíneo  
5. Generación de estatus médico y estatus de vida  
6. Generación de fecha de última cita  
7. Generación de país de origen  
8. Generación de título de cortesía  

📌 Estas funciones **no realizan inserciones ni modificaciones en las tablas**, únicamente **retornan valores** que son consumidos por el procedimiento almacenado principal.


### 🧠 Procedimiento Almacenado

El procedimiento principal (`sp_pacientes`) es el encargado de coordinar todo el proceso de generación de datos, realizando las siguientes tareas:

- Invocar las funciones auxiliares
- Generar los datos completos de cada registro
- Insertar la información en las tablas correspondientes
- Validar los parámetros de entrada
- Controlar la ejecución mediante transacciones

Este procedimiento **centraliza toda la lógica del proceso de población de datos**, garantizando orden y consistencia.


### 🔁 Manejo de Transacciones

El procedimiento utiliza **control transaccional** para asegurar la integridad de la información durante la ejecución:

```sql
START TRANSACTION;
-- generación e inserción de datos
COMMIT;
-- en caso de error
ROLLBACK;
