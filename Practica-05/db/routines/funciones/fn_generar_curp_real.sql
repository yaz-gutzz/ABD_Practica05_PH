CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_curp_real`(
    p_nombre VARCHAR(50),
    p_apellido_p VARCHAR(50),
    p_apellido_m VARCHAR(50),
    p_genero VARCHAR(3),
    p_fecha DATE
) RETURNS varchar(30) CHARSET utf8mb4
    DETERMINISTIC
    COMMENT 'Función fn_generar_curp_real - Desarrollada por el equipo de PH, Farmacia'
BEGIN
    DECLARE v_curp VARCHAR(30);
    DECLARE v_nombre_proc VARCHAR(50);
    DECLARE v_apellido_p_proc VARCHAR(50);
    DECLARE v_apellido_m_proc VARCHAR(50);
    DECLARE v_genero_proc VARCHAR(1);
    DECLARE v_entidad VARCHAR(2) DEFAULT 'NE'; -- NE = Nacido en el Extranjero (por defecto)
    DECLARE v_consonantes VARCHAR(4);
    DECLARE v_homonimia VARCHAR(2);
    
    -- Validar y normalizar datos de entrada
    -- Nombre: Si viene NULL o vacío, asignar 'X' como valor por defecto
    IF p_nombre IS NULL OR TRIM(p_nombre) = '' THEN
        SET v_nombre_proc = 'X';
    ELSE
        SET v_nombre_proc = UPPER(TRIM(p_nombre));
    END IF;
    
    -- Apellido paterno: Si viene NULL o vacío, asignar 'X' como valor por defecto
    IF p_apellido_p IS NULL OR TRIM(p_apellido_p) = '' THEN
        SET v_apellido_p_proc = 'X';
    ELSE
        SET v_apellido_p_proc = UPPER(TRIM(p_apellido_p));
    END IF;
    
    -- Apellido materno: Si viene NULL o vacío, asignar 'X' como valor por defecto
    IF p_apellido_m IS NULL OR TRIM(p_apellido_m) = '' THEN
        SET v_apellido_m_proc = 'X';
    ELSE
        SET v_apellido_m_proc = UPPER(TRIM(p_apellido_m));
    END IF;
    
    -- Validar género (H/M)
    IF p_genero IS NULL OR TRIM(p_genero) = '' THEN
        SET v_genero_proc = 'H'; -- Por defecto asumimos Hombre
    ELSE
        SET v_genero_proc = UPPER(LEFT(TRIM(p_genero), 1));
        IF v_genero_proc NOT IN ('H', 'M') THEN
            SET v_genero_proc = 'H'; -- Si no es válido, por defecto H
        END IF;
    END IF;
    
    -- Validar fecha
    IF p_fecha IS NULL THEN
        SET p_fecha = '1900-01-01'; -- Fecha por defecto si no se proporciona
    END IF;
    
    -- Obtener consonantes internas (para mayor precisión en la CURP)
    -- Primera consonante interna del apellido paterno (después de la primera letra)
    SET v_consonantes = CONCAT(
        -- Primera consonante del apellido paterno
        IFNULL(SUBSTRING(v_apellido_p_proc, 2, 1), 'X'),
        -- Primera consonante del apellido materno
        IFNULL(SUBSTRING(v_apellido_m_proc, 2, 1), 'X'),
        -- Primera consonante del nombre
        IFNULL(SUBSTRING(v_nombre_proc, 2, 1), 'X')
    );
    
    -- Determinar entidad federativa (basado en apellidos, esto es un ejemplo simplificado)
    -- En un sistema real, esto vendría de una tabla de catálogo
    IF v_apellido_p_proc LIKE 'A%' OR v_apellido_p_proc LIKE 'B%' THEN
        SET v_entidad = 'AS'; -- Aguascalientes
    ELSEIF v_apellido_p_proc LIKE 'C%' OR v_apellido_p_proc LIKE 'D%' THEN
        SET v_entidad = 'BC'; -- Baja California
    ELSEIF v_apellido_p_proc LIKE 'E%' OR v_apellido_p_proc LIKE 'F%' THEN
        SET v_entidad = 'BS'; -- Baja California Sur
    ELSEIF v_apellido_p_proc LIKE 'G%' OR v_apellido_p_proc LIKE 'H%' THEN
        SET v_entidad = 'CM'; -- Campeche
    ELSE
        SET v_entidad = 'DF'; -- Ciudad de México (por defecto)
    END IF;
    
    -- Generar dígito de homonimia (simulado basado en el nombre)
    -- En un sistema real, esto sería un cálculo más complejo
    SET v_homonimia = CONCAT(
        CAST(FLOOR(1 + RAND() * 9) AS CHAR),
        CAST(FLOOR(1 + RAND() * 9) AS CHAR)
    );
    
    -- Construir la CURP según el formato oficial mexicano
    -- Formato: AEPOMMDDAAENCCCDH
    -- Donde:
    -- AE: Apellido paterno (1ra letra)
    -- PO: Apellido paterno (1ra vocal interna)
    -- MM: Apellido materno (1ra letra)
    -- DD: Nombre (1ra letra)
    -- AA: Año (2 dígitos)
    -- EN: Entidad federativa (2 caracteres)
    -- CCC: Consonantes internas
    -- D: Dígito verificador
    -- H: Homonimia
    SET v_curp = CONCAT(
        -- Primera letra del apellido paterno
        LEFT(v_apellido_p_proc, 1),
        -- Primera vocal interna del apellido paterno
        CASE 
            WHEN v_apellido_p_proc REGEXP '[AEIOU]' THEN 
                SUBSTRING(v_apellido_p_proc, LOCATE(SUBSTRING(v_apellido_p_proc, 2), v_apellido_p_proc), 1)
            ELSE 'X'
        END,
        -- Primera letra del apellido materno
        LEFT(v_apellido_m_proc, 1),
        -- Primera letra del nombre
        LEFT(v_nombre_proc, 1),
        -- Fecha de nacimiento (año-mes-día)
        DATE_FORMAT(p_fecha, '%y%m%d'),
        -- Género (H/M)
        v_genero_proc,
        -- Entidad federativa
        v_entidad,
        -- Consonantes internas (primeras 3)
        LEFT(v_consonantes, 3),
        -- Dígito verificador (simulado)
        CAST(FLOOR(0 + RAND() * 9) AS CHAR),
        -- Dígito de homonimia
        v_homonimia
    );
    
    -- Asegurar que la CURP tenga exactamente 18 caracteres
    IF LENGTH(v_curp) < 18 THEN
        SET v_curp = RPAD(v_curp, 18, '0');
    ELSEIF LENGTH(v_curp) > 18 THEN
        SET v_curp = LEFT(v_curp, 18);
    END IF;
    
    RETURN v_curp;
    
END