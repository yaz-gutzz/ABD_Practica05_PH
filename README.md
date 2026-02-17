# 🏥 Práctica 05 - Población Automática de Datos de Pacientes

## 📌 Descripción

Esta práctica implementa un **sistema completo de generación automática de datos de pacientes** mediante rutinas SQL avanzadas (funciones y procedimientos almacenados). El proyecto está diseñado para:

- Generar dinámicamente **pacientes con datos coherentes y realistas**
- Respetar la **estructura jerárquica relacional** del modelo hospitalario
- Asegurar **integridad referencial** y **consistencia de datos**
- Aplicar **reglas de negocio complejas** (RFC, CURP, edad lógica, etc.)
- Optimizar el rendimiento con **transacciones por lotes** y **batch processing**

El sistema ha sido sometido a **pruebas exhaustivas** de volumen (hasta 1,000,000 registros) y naturaleza (escenarios específicos) para validar su correcto funcionamiento.

---

## 🎯 Objetivos del Proyecto

✅ Implementar **generación modular y reutilizable** de datos mediante funciones especializadas  
✅ Aplicar **reglas de negocio complejas** para garantizar coherencia lógica  
✅ Respetar la **estructura jerárquica relacional** del modelo (3 tablas interconectadas)  
✅ Validar **integridad referencial** mediante llaves foráneas y transacciones  
✅ Utilizar **mecanismos SQL avanzados** (ELT, RAND, Subqueries, TRANSACTIONS, etc.)  
✅ Ejecutar **pruebas de volumen** (1M+ registros) y **pruebas de naturaleza** (escenarios específicos)  
✅ Optimizar rendimiento mediante **batch processing de 5000 registros**  
✅ Documentar completamente el proyecto en GitHub con respaldos incluidos  

---

---

## 📂 Estructura del Proyecto

```
📦 ABD_Practica05_PH
 ┣ 📁 Practica-05/
 ┃ ┣ 📁 dashboard/              # Interfaz de visualización
 ┃ ┣ 📁 db/
 ┃ ┃ ┣ 📁 backups/              # Respaldos de BD
 ┃ ┃ ┣ 📁 routines/             # Rutinas SQL
 ┃ ┃ ┃ ┣ 📁 funciones/          # Funciones auxiliares (8 funciones)
 ┃ ┃ ┃ ┃ ┗ 📄 readme.md         # Documentación detallada
 ┃ ┃ ┃ ┣ 📁 procedimiento/      # Procedimiento principal
 ┃ ┃ ┃ ┃ ┗ 📄 readme.md         # Documentación detallada
 ┃ ┃ ┣ 📁 scripts/              # Scripts de utilidad
 ┃ ┃ ┗ 📁 test/                 # Pruebas realizadas
 ┃ ┗ 📄 readme.md
 ┗ 📄 README.md                  # Este archivo
```

---

## 🏗 Modelo Relacional

## 🏗 Modelo Relacional

### 📊 Tablas del Sistema

| # | Tabla | Descripción | Registros |
|---|-------|-------------|-----------|
| 1 | **tbb_personas** | Tabla raíz - Datos básicos de cualquier persona | PK: ID |
| 2 | **tbb_personas_fisicas** | Extensión - Datos específicos de personas físicas | FK: ID → tbb_personas |
| 3 | **tbb_pacientes** | Especialización - Información médica del paciente | FK: ID → tbb_personas |

### 🔗 Estructura Jerárquica

```
┌─────────────────────────────┐
│    tbb_personas             │
│  (PK: ID)                   │
│  - ID (INT, AI)             │
│  - tipo (VARCHAR)           │
│  - rfc (VARCHAR, UNIQUE)    │
│  - pais_origen (VARCHAR)    │
│  - fecha_actualizacion      │
└────────────┬────────────────┘
             │ FK: ID
             ▼
┌─────────────────────────────┐
│  tbb_personas_fisicas       │
│  (PK: ID, FK)               │
│  - ID (INT)                 │
│  - titulo_cortesia (VARCHAR)│
│  - nombre (VARCHAR)         │
│  - primer_apellido (VARCHAR)│
│  - segundo_apellido (VARCHAR)
│  - genero (VARCHAR)         │
│  - fecha_nacimiento (DATE)  │
│  - curp (VARCHAR, UNIQUE)   │
│  - grupo_sanguineo (VARCHAR)│
└────────────┬────────────────┘
             │ FK: ID
             ▼
┌─────────────────────────────┐
│     tbb_pacientes           │
│  (PK: ID, FK)               │
│  - ID (INT)                 │
│  - estatus_medico (VARCHAR) │
│  - estatus_vida (VARCHAR)   │
│  - fecha_ultima_citamedica  │
└─────────────────────────────┘
```

---

## ⚙️ Rutinas SQL Implementadas

### 🔧 Funciones Modulares (8 Funciones)

El sistema cuenta con **8 funciones especializadas** que modularmente generan valores específicos:

| # | Función | Propósito | Retorna |
|---|---------|----------|---------|
| 1 | `fn_generar_nombre_real()` | Nombre aleatorio realista | VARCHAR(50) |
| 2 | `fn_apellido_real()` | Apellido aleatorio realista | VARCHAR(50) |
| 3 | `fn_generar_curp_real()` | CURP válido y único | VARCHAR(30) |
| 4 | `fn_generar_genero()` | Género M/F aleatorio | VARCHAR(3) |
| 5 | `fn_generar_edad()` | Edad dentro de rango | INT |
| 6 | `fn_generar_grupo_sanguineo()` | Grupo sanguíneo válido | VARCHAR(5) |
| 7 | `fn_estatus_medico()` | Estado de salud del paciente | VARCHAR(50) |
| 8 | `fn_fecha_ultima_cita()` | Fecha de última cita | DATETIME |

**📋 Documentación completa:** [funciones/readme.md](Practica-05/db/routines/funciones/readme.md)

### 🧠 Procedimiento Principal

#### `sp_poblar_pacientes_goog()`

Procedimiento orquestador central que **coordina toda la generación de datos**:

```sql
CALL sp_poblar_pacientes_goog(
    p_cantidad INT,              -- Número de pacientes a generar
    p_genero VARCHAR(3),         -- Género específico (M/F) o NULL
    p_edad_min INT,              -- Edad mínima
    p_edad_max INT,              -- Edad máxima
    p_estatus_vida VARCHAR(20),  -- Estatus de vida
    p_estatus_medico VARCHAR(50) -- Estatus médico
);
```

**Características:**
- ✅ Genera datos coherentes en 3 tablas simultáneamente
- ✅ Transacciones por lotes de 5000 registros (optimización)
- ✅ Validación de parámetros con valores por defecto
- ✅ Prevención de duplicidad en RFC y CURP
- ✅ Uso de `LAST_INSERT_ID()` para integridad referencial

**📋 Documentación completa:** [procedimiento/readme.md](Practica-05/db/routines/procedimiento/readme.md)

---
## 🧪 Pruebas del Sistema

### 📈 Pruebas de Volumen

Validación con diferentes magnitudes de datos:

| Test | Escenario | Registros | Estado |
|------|-----------|-----------|--------|
| 1 | Inserción simple | 1 paciente | ✅ Exitoso |
| 2 | Pequeño lote | 10 pacientes | ✅ Exitoso |
| 3 | Lote mediano | 100 pacientes | ✅ Exitoso |
| 4 | Lote grande | 1,000 pacientes | ✅ Exitoso |
| 5 | Lote muy grande | 10,000 pacientes | ✅ Exitoso |
| 6 | Volumen masivo | 1,000,000 pacientes | ✅ Exitoso |

### 🎯 Pruebas de Naturaleza

Validación con filtros y escenarios específicos:

| Test | Escenario | Registros | Filtro | Estado |
|------|-----------|-----------|--------|--------|
| 7 | Género femenino | 150 | Mujeres | ✅ Exitoso |
| 8 | Género-Edad | 340 | Hombres 20-30 años | ✅ Exitoso |
| 9 | Rango edad máximo | 500 | Edad ≤ 65 años | ✅ Exitoso |
| 10 | Estatus vida | 2,200 | Pacientes vivos | ✅ Exitoso |
| 11 | Género-Edad-Estatus | 502 | Mujeres finadas > 45 | ✅ Exitoso |
| 12 | Estatus médico crítico | 30 | En coma | ✅ Exitoso |
| 13 | Estatus médico especial | 15 | Estado vegetativo | ✅ Exitoso |
| 14 | Cuidados paliativos | 107 | En cuidados paliativos | ✅ Exitoso |
| 15 | Pacientes pediátricos | 208 | Menores de edad | ✅ Exitoso |

### ✅ Validaciones Ejecutadas

En **todas las pruebas** se verificó:

- ✅ **Rango de edad coherente** con la fecha de nacimiento
- ✅ **Género-Título de cortesía**: consistencia (Sr. para M, Sra. para F)
- ✅ **Estatus médico-vida**: consistencia lógica
- ✅ **Integridad relacional**: todas las FK apuntan a registros existentes
- ✅ **Unicidad**: RFC y CURP no duplicados
- ✅ **Datos completos**: sin valores NULL en campos obligatorios

---

## 🔐 Reglas de Negocio Aplicadas

1. **RFC Único:** Cada persona tiene un RFC único e irrepetible
2. **CURP Única:** Cada persona física tiene una CURP única e irrepetible
3. **Edad Lógica:** Edad coherente con fecha de nacimiento (calculada automáticamente)
4. **Género-Cortesía:** Título de cortesía acorde al género
5. **Grupo Sanguíneo Válido:** Solo valores permitidos (O±, A±, B±, AB±)
6. **Estatus Médico-Vida:** Estados válidos según reglas de negocio
7. **Validación de Parámetros:** Rechazo de datos inválidos con valores por defecto
8. **Integridad Referencial:** Cumplimiento de llaves foráneas en todas las inserciones

---

## 📦 Respaldos Incluidos

El proyecto incluye **3 tipos de respaldos** en la carpeta `db/backups/`:

1. **Respaldo Estructural** - Tablas y esquema vacío
2. **Respaldo Funcional** - Funciones y procedimientos almacenados
3. **Respaldo Post-Población** - Estructura + Rutinas + 1M de registros

Los respaldos permiten reconstruir la BD en caso de necesidad.

---

## 🌿 Manejo de Ramas y Control de Versiones

El proyecto mantiene una **estructura de ramales organizada** para trabajo colaborativo:

```
main (rama principal)
 ├── Practica05 (rama de desarrollo)
 │   ├── Practica05-Obed
 │   ├── Practica05-Yazmin         ← Tu rama
 │   ├── Practica05-Citlalli
 │   └── Practica05-Michelle
```

**Política de Ramas:**
- ✅ Cada desarrollador trabaja en su rama personal
- ✅ Cambios consolidados a `Practica05` antes de PR a `main`
- ✅ Merge a `main` requiere validación de tests
- ✅ Historial Git limpio y trazable

---

## 📚 Documentación Disponible

| Documento | Ubicación | Contenido |
|-----------|-----------|----------|
| **README Principal** | `README.md` | Este archivo - Visión general |
| **Funciones** | `Practica-05/db/routines/funciones/readme.md` | Detalles de 8 funciones |
| **Procedimiento** | `Practica-05/db/routines/procedimiento/readme.md` | Detalles del procedimiento |
| **Rutinas General** | `Practica-05/db/routines/readme.md` | Visión de arquitectura |

---

## 🚀 Cómo Usar el Sistema

### 1. **Preparar el Ambiente**

```sql
-- Crear BD (si no existe)
CREATE DATABASE hospital_pacientes;
USE hospital_pacientes;

-- Ejecutar respaldo estructural
SOURCE db/backups/respaldo_estructural.sql;

-- Ejecutar funciones
SOURCE db/routines/funciones/*.sql;

-- Ejecutar procedimiento
SOURCE db/routines/procedimiento/sp_poblar_pacientes.sql;
```

### 2. **Generar Datos**

```sql
-- Ejemplo 1: 1000 pacientes aleatorios
CALL sp_poblar_pacientes_goog(1000, NULL, NULL, NULL, NULL, NULL);

-- Ejemplo 2: 500 mujeres entre 20-60 años
CALL sp_poblar_pacientes_goog(500, 'F', 20, 60, NULL, NULL);

-- Ejemplo 3: 300 hombres vivos con estado estable
CALL sp_poblar_pacientes_goog(300, 'M', 18, 85, 'Vivo', 'Estable');
```

### 3. **Verificar Datos**

```sql
-- Contar registros totales
SELECT COUNT(*) as total_pacientes FROM tbb_pacientes;

-- Ver muestra de datos
SELECT p.ID, pf.nombre, pf.primer_apellido, pf.fecha_nacimiento, 
       pc.estatus_medico, pc.estatus_vida
FROM tbb_personas p
JOIN tbb_personas_fisicas pf ON p.ID = pf.ID
JOIN tbb_pacientes pc ON p.ID = pc.ID
LIMIT 10;

-- Análisis de estatus
SELECT estatus_medico, COUNT(*) as cantidad
FROM tbb_pacientes
GROUP BY estatus_medico;
```

---

## 🛠 Tecnologías Utilizadas

- **Base de Datos:** MySQL 5.7+ / 8.0+
- **Lenguaje:** T-SQL (MySQL Procedural SQL)
- **Herramientas de Desarrollo:** VS Code, MySQL Workbench
- **Control de Versiones:** Git / GitHub
- **Documentación:** Markdown

---

## 📊 Mecanismos SQL Avanzados Implementados

- ✅ **ELT()** - Selección aleatoria de valores
- ✅ **RAND()** - Generación de números aleatorios
- ✅ **SUBQUERIES** - Consultas anidadas complejas
- ✅ **TRANSACTIONS** - Control de transacciones
- ✅ **COMMIT/ROLLBACK** - Manejo de errores
- ✅ **DECLARE** - Variables locales
- ✅ **WHILE** - Bucles determinísticos
- ✅ **IF/ELSE** - Lógica condicional
- ✅ **DATE_SUB()** - Manipulación de fechas
- ✅ **LAST_INSERT_ID()** - Recuperación de claves generadas

---

## 🎓 Conclusión

Este proyecto demuestra una **implementación profesional y robusta** de:

✅ Diseño jerárquico y relacional correcto  
✅ Integridad referencial garantizada mediante FK y transacciones  
✅ Modularización efectiva con 8 funciones reutilizables  
✅ Aplicación correcta de reglas de negocio complejas  
✅ Validación exhaustiva mediante pruebas de volumen y naturaleza  
✅ Optimización de rendimiento con batch processing  
✅ Documentación completa y clara en todos los niveles  
✅ Respaldos incluidos para recuperación ante fallos  
✅ Uso profesional de control de versiones en Git  

El sistema está **listo para producción** y puede escalar a millones de registros manteniendo integridad y rendimiento.

---

## 👥 Equipo de Desarrollo

- **Yazmin** - Rama: `Practica05-Yazmin`
- **Obed** - Rama: `Practica05-Obed`
- **Citlalli** - Rama: `Practica05-Citlalli`
- **Michelle** - Rama: `Practica05-Michelle`

---

## 📝 Notas Importantes

⚠️ **Requisitos Previos:**
- MySQL 5.7 o superior
- Permisos para crear rutinas (FUNCTION, PROCEDURE)
- Permisos INSERT en las tablas destino

⚠️ **Limitaciones Conocidas:**
- El máximo recomendado es 100,000 registros por ejecución del procedimiento
- Requiere que todas las funciones estén creadas antes de ejecutar el procedimiento

✅ **Características Garantizadas:**
- Integridad referencial 100%
- RFC/CURP únicos y válidos
- Datos coherentes (edad lógica, género-cortesía, etc.)
- Rendimiento optimizado (5000 registros/transacción)

---

**Última actualización:** Febrero 16, 2026  
**Estado del Proyecto:** ✅ Completado y Operativo


    