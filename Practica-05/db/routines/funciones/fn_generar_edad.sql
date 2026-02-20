CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_edad`(
    p_min INT, 
    p_max INT
) RETURNS int
    DETERMINISTIC
    COMMENT 'Función fn_generar_edad - Desarrollada por el equipo de PH, Farmacia'
BEGIN
    DECLARE v_edad INT;
    DECLARE v_min_validado INT;
    DECLARE v_max_validado INT;
    DECLARE v_rango_valido BOOLEAN DEFAULT TRUE;
    
    -- Validar y normalizar los parámetros de entrada
    -- Si p_min es NULL o menor que 0, establecer valor por defecto (0 años)
    IF p_min IS NULL OR p_min < 0 THEN
        SET v_min_validado = 0;
    ELSE
        SET v_min_validado = p_min;
    END IF;
    
    -- Si p_max es NULL o menor que v_min_validado, establecer valor por defecto (100 años)
    IF p_max IS NULL OR p_max < v_min_validado THEN
        SET v_max_validado = 100;
    ELSE
        SET v_max_validado = p_max;
    END IF;
    
    -- Validar rangos máximos según expectativa de vida humana
    IF v_max_validado > 120 THEN
        SET v_max_validado = 120; -- Límite máximo realista de edad humana
    END IF;
    
    -- Validar que el rango sea válido (mínimo no mayor que máximo)
    IF v_min_validado > v_max_validado THEN
        -- Intercambiar valores si es necesario
        SET v_min_validado = v_max_validado;
        SET v_max_validado = v_min_validado + 50; -- Rango por defecto de 50 años
        SET v_rango_valido = FALSE;
    END IF;
    
    -- Generar edad aleatoria dentro del rango especificado
    SET v_edad = FLOOR(RAND() * (v_max_validado - v_min_validado + 1)) + v_min_validado;
    
    -- Lógica adicional: ajustar la edad según probabilidades demográficas
    -- Esto simula una distribución más realista de la población
    
    -- Si el rango lo permite, aplicar sesgo hacia edades adultas (25-60 años)
    IF v_min_validado <= 60 AND v_max_validado >= 25 AND v_rango_valido THEN
        -- 40% de probabilidad de caer en rango adulto si es posible
        IF RAND() <= 0.4 THEN
            SET v_edad = FLOOR(RAND() * (60 - 25 + 1)) + 25;
        END IF;
    END IF;
    
    -- Redondear a número entero (ya lo es, pero por seguridad)
    SET v_edad = ROUND(v_edad);
    
    -- Clasificar la edad generada (esto es solo informativo, no afecta el resultado)
    -- La función sigue retornando solo la edad, pero internamente podemos tener lógica
    CASE 
        WHEN v_edad < 2 THEN
            -- Bebé (no se modifica la edad, pero podríamos hacer algo especial)
            SET v_edad = v_edad;
        WHEN v_edad BETWEEN 2 AND 12 THEN
            -- Niño/Niña
            SET v_edad = v_edad;
        WHEN v_edad BETWEEN 13 AND 17 THEN
            -- Adolescente
            SET v_edad = v_edad;
        WHEN v_edad BETWEEN 18 AND 30 THEN
            -- Adulto joven
            SET v_edad = v_edad;
        WHEN v_edad BETWEEN 31 AND 60 THEN
            -- Adulto
            SET v_edad = v_edad;
        WHEN v_edad BETWEEN 61 AND 80 THEN
            -- Adulto mayor
            SET v_edad = v_edad;
        ELSE
            -- Anciano
            SET v_edad = v_edad;
    END CASE;
    
    -- Registrar en log (simulado) si la edad es extremadamente alta
    IF v_edad > 100 THEN
        -- En un sistema real, aquí podrías insertar un registro de log
        -- INSERT INTO logs_edades (edad_generada, fecha) VALUES (v_edad, NOW());
        -- Por ahora solo lo dejamos como comentario
        SET v_edad = v_edad; -- No modificamos, solo registramos
    END IF;
    
    RETURN v_edad;
    
END