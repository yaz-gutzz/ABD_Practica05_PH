# Procedimiento Almacenado - sp_poblar_pacientes

##  Descripción General

El procedimiento almacenado **`sp_poblar_pacientes_goog`** es el componente central de la automatización de generación de datos de pacientes. Coordina la invocación de todas las funciones auxiliares para crear registros completos y coherentes de pacientes médicos en la base de datos.

Este procedimiento actúa como **orquestador principal** que:
- Genera datos aleatorios pero realistas
- Inserta registros en múltiples tablas relacionadas
- Maneja transacciones por lotes para optimizar rendimiento
- Valida parámetros de entrada



##  Información del Procedimiento

**Nombre:** `sp_poblar_pacientes_goog`

**Tipo:** Procedimiento Almacenado (PROCEDURE)

**Definer:** `root@localhost`

**Ubicación:** `Practica-05/db/routines/procedimiento/sp_poblar_pacientes.sql`


##  Parámetros de Entrada

El procedimiento acepta **6 parámetros de entrada** que controlan el comportamiento de la generación de datos:

| Parámetro | Tipo | Descripción | Obligatorio | Ejemplo |
|-----------|------|-------------|-------------|---------|
| `p_cantidad` | INT | Número de pacientes a generar | ✅ Sí | 1000 |
| `p_genero` | VARCHAR(3) | Género específico (M/F) o nulo para aleatorio | ❌ No | "M" o NULL |
| `p_edad_min` | INT | Edad mínima de pacientes a generar | ❌ No | 18 |
| `p_edad_max` | INT | Edad máxima de pacientes a generar | ❌ No | 85 |
| `p_estatus_vida` | VARCHAR(20) | Estatus de vida del paciente | ❌ No | "Vivo" |
| `p_estatus_medico` | VARCHAR(50) | Estatus médico del paciente | ❌ No | "Estable" |

### Valores por Defecto

- `p_edad_min` → 0 (si es NULL)
- `p_edad_max` → 120 (si es NULL)


## 🔄 Flujo de Ejecución

### 1. **Inicialización**
```sql
SET p_edad_min = IFNULL(p_edad_min, 0);
SET p_edad_max = IFNULL(p_edad_max, 120);
START TRANSACTION;
```
- Inicializa los parámetros nulos con valores por defecto
- Inicia transacción

### 2. **Bucle de Generación**
Para cada iteración (hasta `p_cantidad`):

#### a) Generar datos personales
```sql
SET v_edad = fn_generar_edad(p_edad_min, p_edad_max);
SET v_fecha_nac = DATE_SUB(CURDATE(), INTERVAL v_edad YEAR);
SET v_genero = fn_generar_genero(p_genero);
SET v_nombre = fn_nombre_real();
SET v_apellido_p = fn_apellido_real();
SET v_apellido_m = fn_apellido_real();
```

#### b) Insertar en tabla `tbb_personas`
```sql
INSERT INTO tbb_personas(tipo, rfc, pais_origen, fecha_actualizacion)
VALUES('Fisica', fn_generar_rfc_real(...), fn_pais_origen(), NOW());
```
- Registra el tipo de persona (Física)
- Genera y almacena RFC
- Asigna país de origen
- Registra fecha de actualización

#### c) Insertar en tabla `tbb_personas_fisicas`
```sql
INSERT INTO tbb_personas_fisicas(
    ID, titulo_cortesia, nombre, primer_apellido, 
    segundo_apellido, genero, fecha_nacimiento, curp, grupo_sanguineo
)
VALUES(v_id_persona, fn_titulo_cortesia(...), ...)
```
- Almacena datos específicos de personas físicas
- Incluye identificadores generados
- Registra información demográfica completa

#### d) Insertar en tabla `tbb_pacientes`
```sql
INSERT INTO tbb_pacientes(
    ID, estatus_medico, estatus_vida, fecha_ultima_citamedica
)
VALUES(v_id_persona, fn_estatus_medico(...), ...)
```
- Registra información médica del paciente
- Almacena estado de salud actual
- Registra última cita médica

### 3. **Control de Transacciones por Lotes**
```sql
IF i % batch_size = 0 THEN
    COMMIT;
    START TRANSACTION;
END IF;
```
- **batch_size = 5000**: Cada 5000 inserciones se confirma transacción
- Optimiza rendimiento y uso de memoria
- Evita transacciones demasiado largas

### 4. **Finalización**
```sql
COMMIT;
```
- Confirma la última transacción
- Finaliza el procedimiento


##  Funciones Auxiliares Utilizadas

El procedimiento invoca las siguientes funciones (ver `funciones/readme.md`):

| Función | Propósito |
|---------|----------|
| `fn_generar_edad()` | Genera edad dentro del rango especificado |
| `fn_generar_genero()` | Genera género (M/F) |
| `fn_nombre_real()` | Genera nombre aleatorio |
| `fn_apellido_real()` | Genera apellido aleatorio (2x) |
| `fn_generar_rfc_real()` | Genera RFC válido |
| `fn_pais_origen()` | Genera país de origen |
| `fn_titulo_cortesia()` | Genera título de cortesía (Sr./Sra.) |
| `fn_generar_curp_real()` | Genera CURP válido |
| `fn_grupo_sanguineo()` | Genera grupo sanguíneo |
| `fn_estatus_medico()` | Genera estatus médico |
| `fn_estatus_vida()` | Genera estatus de vida |
| `fn_fecha_ultima_cita()` | Genera fecha de última cita |


##  Tablas Destino

El procedimiento inserta datos en **3 tablas relacionadas**:

### 1. `tbb_personas`
Tabla principal de personas
- Campo clave: `ID` (auto-increment)
- Campos: tipo, RFC, país_origen, fecha_actualizacion

### 2. `tbb_personas_fisicas`
Extensión para personas de tipo físico
- FK: `ID` → `tbb_personas.ID`
- Campos: título_cortesia, nombre, apellidos, género, fecha_nacimiento, CURP, grupo_sanguíneo

### 3. `tbb_pacientes`
Información médica
- FK: `ID` → `tbb_personas.ID`
- Campos: estatus_medico, estatus_vida, fecha_ultima_citamedica



##  Manejo de Transacciones

### Estrategia de Lotes (Batch Processing)

```
Total de inserciones = p_cantidad
Tamaño de lote = 5000
Número de commits = p_cantidad / 5000 (redondeado)
```

**Ventajas:**
- ✅ Optimiza consumo de memoria
- ✅ Mejora rendimiento en inserciones masivas
- ✅ Evita bloqueos prolongados
- ✅ Permite recuperación en caso de error parcial

**Ejemplo con 12,500 pacientes:**
1. Commit después de 5,000 inserciones
2. Commit después de 10,000 inserciones
3. Commit final de 2,500 inserciones restantes

---

## 🚀 Ejemplos de Uso

### Ejemplo 1: Generar 1000 pacientes (sin filtros)
```sql
CALL sp_poblar_pacientes_goog(1000, NULL, NULL, NULL, NULL, NULL);
```

### Ejemplo 2: Generar 500 mujeres entre 20 y 60 años
```sql
CALL sp_poblar_pacientes_goog(500, 'F', 20, 60, NULL, NULL);
```

### Ejemplo 3: Generar 300 hombres vivos con estatus estable
```sql
CALL sp_poblar_pacientes_goog(300, 'M', 18, 85, 'Vivo', 'Estable');
```

### Ejemplo 4: Generar 250 pacientes con rango de edad específico
```sql
CALL sp_poblar_pacientes_goog(250, NULL, 65, 95, NULL, NULL);
```

---

## ⚠️ Consideraciones Importantes

### Variables Locales

El procedimiento declara las siguientes variables locales:

```sql
DECLARE i INT DEFAULT 0;                    -- Contador del bucle
DECLARE batch_size INT DEFAULT 5000;         -- Tamaño de lote
DECLARE v_id_persona INT;                    -- ID de la persona generada
DECLARE v_edad INT;                          -- Edad calculada
DECLARE v_fecha_nac DATE;                    -- Fecha de nacimiento
DECLARE v_genero VARCHAR(3);                 -- Género
DECLARE v_nombre VARCHAR(50);                -- Nombre
DECLARE v_apellido_p VARCHAR(50);            -- Apellido paterno
DECLARE v_apellido_m VARCHAR(50);            -- Apellido materno
```

### Comportamiento del LAST_INSERT_ID()

- Obtiene el ID generado en la inserción anterior en `tbb_personas`
- Se usa para establecer relaciones con las otras tablas
- Asegura integridad referencial

### Rendimiento

- **Tiempo estimado:** ~0.10-1 segundo por 1000 registros (varía según hardware)
- **Espacio requerido:** ~1-2 MB por 1000 registros
- **Máximo recomendado:** 100,000 pacientes por ejecución

---

## 🔍 Monitoreo y Verificación

### Verificar registros insertados
```sql
SELECT COUNT(*) FROM tbb_personas;
SELECT COUNT(*) FROM tbb_personas_fisicas;
SELECT COUNT(*) FROM tbb_pacientes;
```

### Ver detalles de pacientes generados
```sql
SELECT 
    p.ID,
    pf.nombre,
    pf.numero_seguro_social,
    pf.genero,
    pf.fecha_nacimiento,
    pc.estatus_medico,
    pc.estatus_vida,
    pc.fecha_ultima_citamedica
FROM tbb_personas p
JOIN tbb_personas_fisicas pf ON p.ID = pf.ID
JOIN tbb_pacientes pc ON p.ID = pc.ID
LIMIT 10;
```


## 📌 Notas Técnicas

- ✅ Procedimiento **DETERMINISTIC** para mejor rendimiento
- ✅ Manejo de **transacciones** garantiza integridad de datos
- ✅ **Batch processing** optimiza inserciones masivas
- ✅ Compatible con **MySQL 5.7+** y **MySQL 8.0+**
- ⚠️ Requiere que todas las funciones auxiliares estén creadas previamente
- ⚠️ Requiere **permisos INSERT** en las tres tablas destino



## 🎓 Integración con el Proyecto

Este procedimiento es parte de la automatización completa de generación de datos en el sistema médico:

1. **Funciones** (`funciones/`) → Generan valores individuales
2. **Procedimiento** (este archivo) → Orquesta la generación e inserción
3. **Scripts** (`scripts/`) → Pueden llamar este procedimiento
4. **Pruebas** (`test/`) → Validan los datos generados
