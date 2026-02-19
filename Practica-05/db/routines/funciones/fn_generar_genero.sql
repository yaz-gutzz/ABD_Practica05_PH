CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_genero`(
    p_genero VARCHAR(3)
) RETURNS varchar(3) CHARSET utf8mb4
    DETERMINISTIC
    COMMENT 'Función fn_generar_genero - Desarrollada por el equipo de PH, Farmacia'
BEGIN
    DECLARE v_genero VARCHAR(3);
    DECLARE v_hora_actual INT;
    DECLARE v_dia_semana INT;
    DECLARE v_probabilidad FLOAT;
    
    -- Obtener información contextual para lógica adicional
    SET v_hora_actual = HOUR(NOW());
    SET v_dia_semana = DAYOFWEEK(NOW()); -- 1=domingo, 2=lunes, ..., 7=sábado
    SET v_probabilidad = RAND();
    
    -- Validación y normalización del parámetro de entrada
    IF p_genero IS NOT NULL AND TRIM(p_genero) != '' THEN
        SET p_genero = UPPER(TRIM(p_genero));
        
        -- Expandir variantes comunes a valores estándar
        CASE 
            -- Variantes de Hombre/Masculino
            WHEN p_genero IN ('H', 'M', 'MAS', 'MASCULINO', 'HOMBRE', 'VARON', 'MALE') THEN
                SET v_genero = 'H';
                
            -- Variantes de Mujer/Femenino
            WHEN p_genero IN ('M', 'F', 'FEM', 'FEMENINO', 'MUJER', 'FEMALE') THEN
                SET v_genero = 'M';
                
            -- Variantes de No Binario/Otros
            WHEN p_genero IN ('N/B', 'NB', 'NO BINARIO', 'OTRO', 'OTHER', 'X', 'NO ESPECIFICA') THEN
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
    
    -- Si llegamos aquí, necesitamos generar un género aleatorio
    -- pero con lógica más sofisticada basada en contexto
    
    -- Ajustar probabilidades según el día de la semana
    -- (Esto es un ejemplo de lógica de negocio, podría adaptarse a necesidades reales)
    
    -- Los fines de semana (viernes a domingo) hay más probabilidad de N/B
    IF v_dia_semana IN (6, 7, 1) THEN -- viernes, sábado, domingo
        -- Distribución: 45% H, 45% M, 10% N/B
        SET v_genero = CASE 
            WHEN v_probabilidad <= 0.45 THEN 'H'
            WHEN v_probabilidad <= 0.90 THEN 'M'
            ELSE 'N/B'
        END;
    ELSE
        -- Días entre semana: 48% H, 48% M, 4% N/B
        SET v_genero = CASE 
            WHEN v_probabilidad <= 0.48 THEN 'H'
            WHEN v_probabilidad <= 0.96 THEN 'M'
            ELSE 'N/B'
        END;
    END IF;
    
    -- Ajustar según la hora del día (otro ejemplo de lógica contextual)
    IF v_hora_actual BETWEEN 0 AND 5 THEN -- Madrugada
        -- En la madrugada, distribución más balanceada
        SET v_genero = ELT(FLOOR(1 + RAND()*3), 'H', 'M', 'N/B');
    END IF;
    
    -- Validación final (por seguridad)
    IF v_genero NOT IN ('H', 'M', 'N/B') THEN
        SET v_genero = ELT(FLOOR(1 + RAND()*3), 'H', 'M', 'N/B');
    END IF;
    
    -- Registrar estadísticas (simulado)
    -- En un entorno real, aquí se podría insertar en una tabla de logs
    -- INSERT INTO logs_genero (genero_generado, fecha_hora, contexto) 
    -- VALUES (v_genero, NOW(), CONCAT('Hora:', v_hora_actual, ', Dia:', v_dia_semana));
    
    RETURN v_genero;
    
END