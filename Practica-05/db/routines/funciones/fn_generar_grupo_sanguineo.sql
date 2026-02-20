CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_genero`(
    p_genero VARCHAR(3)
) RETURNS varchar(3) CHARSET utf8mb4
    DETERMINISTIC
    COMMENT 'Función fn_generar_genero - Desarrollada por el equipo de PH, Farmacia'
BEGIN
    DECLARE v_genero VARCHAR(3);
    DECLARE v_tipo_paciente VARCHAR(20);
    DECLARE v_edad INT;
    DECLARE v_servicio VARCHAR(50);
    DECLARE v_probabilidad FLOAT;
    
    -- Obtener contexto del sistema (simulado - en un sistema real vendría de variables de sesión)
    SET v_tipo_paciente = COALESCE(@tipo_paciente, 'GENERAL');
    SET v_edad = COALESCE(@edad_paciente, 30);
    SET v_servicio = COALESCE(@servicio_medico, 'GENERAL');
    SET v_probabilidad = RAND();
    
    -- Validación y normalización del parámetro de entrada
    IF p_genero IS NOT NULL AND TRIM(p_genero) != '' THEN
        SET p_genero = UPPER(TRIM(p_genero));
        
        -- Mapeo de variantes comunes a valores estándar
        CASE 
            -- Hombre / Masculino
            WHEN p_genero IN ('H', 'M', 'MAS', 'MASC', 'MASCULINO', 'HOMBRE', 'VARON', 'MALE', 'BOY', 'MAN') THEN
                SET v_genero = 'H';
                
            -- Mujer / Femenino
            WHEN p_genero IN ('M', 'F', 'FEM', 'FEMENINO', 'MUJER', 'FEMALE', 'GIRL', 'WOMAN') THEN
                SET v_genero = 'M';
                
            -- No Binario / Otros
            WHEN p_genero IN ('N/B', 'NB', 'NO BINARIO', 'OTRO', 'OTHER', 'X', 'NO ESPECIFICA', 'PREFIERO NO DECIR', 'INDEFINIDO') THEN
                SET v_genero = 'N/B';
                
            -- Cualquier otro valor no reconocido
            ELSE
                SET v_genero = NULL;
        END CASE;
        
        -- Si se pudo normalizar, retornar el valor válido
        IF v_genero IS NOT NULL AND v_genero IN ('H', 'M', 'N/B') THEN
            RETURN v_genero;
        END IF;
    END IF;
    
    -- Si llegamos aquí, generamos género basado en lógica contextual
    
    -- Lógica 1: Distribución según tipo de paciente
    IF v_tipo_paciente = 'PEDIATRIA' THEN
        -- En pediatría, distribución equitativa
        SET v_genero = ELT(FLOOR(1 + RAND()*2), 'H', 'M'); -- Sin N/B en pediatría
    ELSEIF v_tipo_paciente = 'GERIATRIA' THEN
        -- En geriatría, más mujeres (mayor esperanza de vida)
        SET v_genero = CASE 
            WHEN v_probabilidad <= 0.4 THEN 'H'
            WHEN v_probabilidad <= 0.9 THEN 'M'
            ELSE 'N/B'
        END;
    ELSEIF v_tipo_paciente = 'OBSTETRICIA' THEN
        -- En obstetricia, solo mujeres
        SET v_genero = 'M';
    ELSEIF v_tipo_paciente = 'UROLOGIA' THEN
        -- En urología, solo hombres
        SET v_genero = 'H';
    ELSE
        -- Lógica 2: Distribución según edad
        IF v_edad < 15 THEN
            -- Población infantil: distribución natural 51% H, 49% M
            SET v_genero = CASE 
                WHEN v_probabilidad <= 0.51 THEN 'H'
                ELSE 'M'
            END;
        ELSEIF v_edad BETWEEN 15 AND 40 THEN
            -- Población adulta joven: más mujeres en edad fértil
            SET v_genero = CASE 
                WHEN v_probabilidad <= 0.48 THEN 'H'
                WHEN v_probabilidad <= 0.97 THEN 'M'
                ELSE 'N/B'
            END;
        ELSEIF v_edad BETWEEN 41 AND 65 THEN
            -- Población adulta: distribución más balanceada
            SET v_genero = CASE 
                WHEN v_probabilidad <= 0.49 THEN 'H'
                WHEN v_probabilidad <= 0.98 THEN 'M'
                ELSE 'N/B'
            END;
        ELSE
            -- Adultos mayores: más mujeres
            SET v_genero = CASE 
                WHEN v_probabilidad <= 0.4 THEN 'H'
                WHEN v_probabilidad <= 0.95 THEN 'M'
                ELSE 'N/B'
            END;
        END IF;
    END IF;
    
    -- Lógica 3: Ajustes por servicio médico
    IF v_servicio = 'CARDIOLOGIA' THEN
        -- En cardiología, más hombres
        IF v_genero = 'M' AND RAND() < 0.3 THEN
            SET v_genero = 'H';
        END IF;
    ELSEIF v_servicio = 'ENDOCRINOLOGIA' THEN
        -- En endocrinología, más mujeres
        IF v_genero = 'H' AND RAND() < 0.3 THEN
            SET v_genero = 'M';
        END IF;
    END IF;
    
    -- Lógica 4: Variación estacional (ejemplo)
    IF MONTH(NOW()) IN (3, 4, 5) THEN -- Primavera
        -- En primavera, ligeramente más nacimientos de mujeres (estadística real)
        IF v_genero = 'H' AND RAND() < 0.05 THEN
            SET v_genero = 'M';
        END IF;
    END IF;
    
    -- Lógica 5: Distribución por hora del día (turnos hospitalarios)
    IF HOUR(NOW()) BETWEEN 0 AND 5 THEN -- Turno nocturno
        -- En turno nocturno, distribución más equitativa
        SET v_genero = ELT(FLOOR(1 + RAND()*3), 'H', 'M', 'N/B');
    END IF;
    
    -- Validación final y aseguramiento de valor válido
    IF v_genero IS NULL OR v_genero NOT IN ('H', 'M', 'N/B') THEN
        SET v_genero = CASE 
            WHEN RAND() <= 0.49 THEN 'H'
            WHEN RAND() <= 0.98 THEN 'M'
            ELSE 'N/B'
        END;
    END IF;
    
    -- Registrar generación (simulado para estadísticas)
    -- INSERT INTO logs_genero (genero, fecha, tipo_paciente, edad, servicio)
    -- VALUES (v_genero, NOW(), v_tipo_paciente, v_edad, v_servicio);
    
    RETURN v_genero;
    
END