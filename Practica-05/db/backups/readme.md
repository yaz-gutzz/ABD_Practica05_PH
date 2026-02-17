# Backups ![MySQL](https://img.shields.io/badge/MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)

En esta sección se encuentran los archivos de respaldo (backups) del sistema.  
Estos respaldos permiten recuperar la estructura, datos y configuraciones de la base de datos en caso de fallos, pérdidas de información o errores durante el desarrollo.

Los backups están organizados según su propósito, incluyendo:

-  Respaldo estructural (tablas, vistas, procedimientos)
-  Respaldo funcional (datos y configuraciones)
-  Respaldo posterior a la población de datos

---

## 📌 ¿Qué es un Backup?

Un **backup** es una copia de seguridad de la base de datos que permite restaurar información en caso de pérdida, corrupción o fallos del sistema.

---

##  Objetivo

- Garantizar la integridad de la información.
- Permitir la recuperación ante errores.
- Mantener versiones de seguridad durante el desarrollo.
- Facilitar la migración del sistema.

---

##  Estructura del Proyecto

> ABD_PRACTICA05_PH  
>| - Practica-05  
>&nbsp;&nbsp;|- dashboard  
>&nbsp;&nbsp;|- db  
>&nbsp;&nbsp;&nbsp;&nbsp;|- backups  
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|- Respaldo Estructral 
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|- Respaldo Funcional
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|- Respaldo Post Población
>&nbsp;&nbsp;&nbsp;&nbsp;|- routines  
>&nbsp;&nbsp;&nbsp;&nbsp;|- scripts  
>&nbsp;&nbsp;&nbsp;&nbsp;|- test  
>&nbsp;&nbsp;|- README.md  

---


##  Tipos de Backups Incluidos

### 🔹 Respaldo Estructural
Contiene:
- Creación de base de datos
- Tablas
- Índices
- Procedimientos almacenados
- Triggers

### 🔹 Respaldo Funcional
Incluye:
- Inserciones de datos
- Configuraciones iniciales
- Roles y privilegios

### 🔹 Respaldo Post-Población
Se genera después de ejecutar procedimientos de inserción masiva o pruebas.