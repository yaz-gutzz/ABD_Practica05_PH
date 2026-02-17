#  Funciones MySQL - Generación de Datos

##  Descripción General

Este conjunto de funciones SQL en MySQL fue creado para automatizar la **generación de datos coherentes y consistentes** en un sistema de gestión de pacientes médicos. Cada función tiene un propósito específico y retorna valores que son utilizados por el procedimiento almacenado principal (`sp_poblar_pacientes`) para poblar la base de datos.


##  Funciones Implementadas

### 1.  Generación de Nombre y Apellido

#### `fn_generar_nombre_real()`
- **Archivo:** `fn_generar_nombre_real.sql`
- **Descripción:** Genera un nombre aleatorio de una lista predefinida
- **Retorna:** VARCHAR(50) - Nombre de persona
- **Ejemplo de salida:** "Carlos", "María", "Sofia", etc.

#### `fn_apellido_real()`
- **Archivo:** `fn_apellido_real.sql`
- **Descripción:** Genera un apellido aleatorio de una lista predefinida
- **Retorna:** VARCHAR(50) - Apellido de persona
- **Ejemplo de salida:** "García", "López", "Martínez", etc.

---

### 2.  Generación de RFC y CURP

#### `fn_generar_curp_real(p_nombre, p_apellido_p, p_apellido_m, p_genero, p_fecha)`
- **Archivo:** `fn_generar_curp_real.sql`
- **Descripción:** Genera un CURP válido basado en los datos personales del individuo
- **Parámetros:**
  - `p_nombre` (VARCHAR) - Nombre de la persona
  - `p_apellido_p` (VARCHAR) - Apellido paterno
  - `p_apellido_m` (VARCHAR) - Apellido materno
  - `p_genero` (VARCHAR) - Género de la persona
  - `p_fecha` (DATE) - Fecha de nacimiento
- **Retorna:** VARCHAR(30) - CURP generado
- **Algoritmo:** Extrae 1 letra de cada apellido y nombre + fecha + género + componente aleatorio
- **Ejemplo de salida:** "GMLC850315HDFJWQ01"

---

### 3.  Generación de Edad y Género

#### `fn_generar_edad()`
- **Archivo:** `fn_generar_edad.sql`
- **Descripción:** Genera una edad aleatoria realista para un paciente
- **Retorna:** INT - Edad en años
- **Rango típico:** 18-85 años

#### `fn_generar_genero()`
- **Archivo:** `fn_generar_genero.sql`
- **Descripción:** Genera un género de forma aleatoria
- **Retorna:** VARCHAR(3) - "M" (Masculino) o "F" (Femenino)

---

### 4.  Generación de Grupo Sanguíneo

#### `fn_generar_grupo_sanguineo()`
- **Archivo:** `fn_generar_grupo_sanguineo.sql`
- **Descripción:** Genera un grupo sanguíneo ABO con factor Rh
- **Retorna:** VARCHAR(5) - Grupo sanguíneo válido
- **Valores posibles:** O+, O-, A+, A-, B+, B-, AB+, AB-

---

### 5.  Generación de Estatus Médico y Estatus de Vida

#### `fn_estatus_medico()`
- **Archivo:** `fn_estatus_medico.sql`
- **Descripción:** Genera un estatus médico del paciente
- **Retorna:** VARCHAR(50) - Estado de salud o condición médica
- **Ejemplos:** "Estable", "Crítico", "Recuperándose", etc.

---

### 6.  Generación de Fecha de Última Cita

#### `fn_fecha_ultima_cita()`
- **Archivo:** `fn_fecha_ultima_cita.sql`
- **Descripción:** Genera una fecha de última cita médica realista
- **Retorna:** DATETIME - Fecha y hora de última consulta
- **Rango:** Fechas recientes (últimos 6-12 meses)

---

### 7. 🌍 Generación de País de Origen

#### `fn_pais_origen()`
- **Archivo:** `fn_pais_origen.sql`
- **Descripción:** Genera un país de origen aleatorio
- **Retorna:** VARCHAR(50) - Nombre del país
- **Nota:** Incluye principalmente países hispanohablantes

---

### 8. 👔 Generación de Título de Cortesía

#### `fn_titulo_cortesina()`
- **Archivo:** `fn_titulo_cortesina.sql`
- **Descripción:** Genera un título de cortesía según el género
- **Retorna:** VARCHAR(10) - Título respetoso
- **Valores posibles:** "Sr.", "Sra.", "Dra.", "Dr.", etc.

---

## 🔧 Características Técnicas

### Propiedades Comunes

- **Determinísticas:** Las funciones están marcadas como `DETERMINISTIC` cuando es posible
- **Charset:** UTF8MB4 para soportar caracteres especiales español
- **Definer:** `root@localhost` (puede ajustarse según permisos)
- **No destructivas:** Solo **RETORNAN valores**, no modifican datos

### Llamadas Típicas

```sql
-- Ejemplo de uso individual
SELECT fn_generar_nombre_real();
SELECT fn_generar_edad();
SELECT fn_generar_grupo_sanguineo();

-- Ejemplo de uso en el procedimiento principal
-- INSERT INTO pacientes VALUES (
--   fn_generar_nombre_real(),
--   fn_apellido_real(),
--   fn_generar_curp_real(...),
--   fn_generar_edad(),
--   fn_generar_genero(),
--   fn_generar_grupo_sanguineo(),
--   fn_estatus_medico(),
--   fn_fecha_ultima_cita(),
--   fn_pais_origen(),
--   fn_titulo_cortesina()
-- );
```

---

## 📊 Integración con el Procedimiento Principal

Estas funciones son consumidas por el procedimiento almacenado **`sp_poblar_pacientes`** ubicado en la carpeta `procedimiento/`, el cual:

1. Invoca todas estas funciones en coordinación
2. Genera datos completos y coherentes para cada paciente
3. Realiza inserciones en las tablas correspondientes
4. Maneja transacciones para garantizar integridad

---

## 📝 Notas Importantes

- ✅ Todas las funciones están **implementadas y operativas**
- ✅ Retornan valores **aleatorios pero realistas**
- ✅ Pueden ser ejecutadas de forma **independiente** para pruebas
- ⚠️ Algunas funciones requieren **parámetros** (como `fn_generar_curp_real`)
- ⚠️ El orden de invocación importa debido a dependencias de datos

---

## 🚀 Próximos Pasos

Para utilizar estas funciones en la población de datos:

1. Asegurar que todas las funciones estén creadas en la BD
2. Ejecutar el procedimiento `sp_poblar_pacientes` con los parámetros deseados
3. Consultar la tabla de pacientes para verificar los datos generados
