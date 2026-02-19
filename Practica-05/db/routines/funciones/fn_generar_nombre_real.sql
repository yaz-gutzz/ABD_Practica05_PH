CREATE DEFINER=`root`@`localhost` FUNCTION `fn_nombre_real`(
    p_genero VARCHAR(3),
    p_pais VARCHAR(2),
    p_anio_nacimiento INT
) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
    COMMENT 'Función fn_nombre_real - Desarrollada por el equipo de PH, Farmacia'
BEGIN
    DECLARE v_nombre VARCHAR(50);
    DECLARE v_genero_norm VARCHAR(1);
    DECLARE v_pais_norm VARCHAR(2);
    DECLARE v_anio INT;
    DECLARE v_decada INT;
    DECLARE v_probabilidad FLOAT;
    
    -- Normalizar parámetros de entrada
    -- Género: si no se especifica o es NULL, aleatorio
    IF p_genero IS NULL OR TRIM(p_genero) = '' THEN
        SET v_genero_norm = ELT(FLOOR(1 + RAND()*2), 'H', 'M');
    ELSE
        SET p_genero = UPPER(TRIM(p_genero));
        SET v_genero_norm = CASE 
            WHEN p_genero IN ('H', 'M', 'MASCULINO', 'HOMBRE', 'MALE') THEN 'H'
            WHEN p_genero IN ('M', 'F', 'FEMENINO', 'MUJER', 'FEMALE') THEN 'M'
            ELSE ELT(FLOOR(1 + RAND()*2), 'H', 'M')
        END;
    END IF;
    
    -- País: si no se especifica, México por defecto
    IF p_pais IS NULL OR TRIM(p_pais) = '' THEN
        SET v_pais_norm = 'MX';
    ELSE
        SET v_pais_norm = UPPER(TRIM(p_pais));
    END IF;
    
    -- Año de nacimiento: si no se especifica, calcular basado en edad promedio
    IF p_anio_nacimiento IS NULL OR p_anio_nacimiento < 1900 OR p_anio_nacimiento > YEAR(NOW()) THEN
        SET v_anio = YEAR(NOW()) - FLOOR(20 + RAND()*50); -- Entre 20 y 70 años
    ELSE
        SET v_anio = p_anio_nacimiento;
    END IF;
    
    -- Calcular década para tendencias de nombres
    SET v_decada = FLOOR(v_anio / 10) * 10;
    SET v_probabilidad = RAND();
    
    -- Selección de nombres según género, país y década
    IF v_genero_norm = 'H' THEN
        -- Nombres de hombre
        CASE 
            -- México
            WHEN v_pais_norm = 'MX' THEN
                CASE 
                    WHEN v_decada <= 1950 THEN
                        SET v_nombre = ELT(FLOOR(1 + RAND()*8), 
                            'Jose', 'Juan', 'Pedro', 'Manuel', 'Francisco', 'Antonio', 'Jesus', 'Guadalupe');
                    WHEN v_decada BETWEEN 1951 AND 1970 THEN
                        SET v_nombre = ELT(FLOOR(1 + RAND()*8), 
                            'Jose Luis', 'Juan Carlos', 'Miguel Angel', 'Carlos', 'Javier', 'Fernando', 'Victor', 'Raul');
                    WHEN v_decada BETWEEN 1971 AND 1990 THEN
                        SET v_nombre = ELT(FLOOR(1 + RAND()*8), 
                            'Alejandro', 'Gerardo', 'David', 'Daniel', 'Luis', 'Jorge', 'Ricardo', 'Eduardo');
                    WHEN v_decada BETWEEN 1991 AND 2010 THEN
                        SET v_nombre = ELT(FLOOR(1 + RAND()*8), 
                            'Diego', 'Kevin', 'Brandon', 'Alan', 'Christian', 'Bryan', 'Adrian', 'Ivan');
                    ELSE
                        SET v_nombre = ELT(FLOOR(1 + RAND()*8), 
                            'Santiago', 'Mateo', 'Sebastian', 'Leonardo', 'Emiliano', 'Dylan', 'Ian', 'Thiago');
                END CASE;
                
            -- España
            WHEN v_pais_norm = 'ES' THEN
                CASE 
                    WHEN v_decada <= 1950 THEN
                        SET v_nombre = ELT(FLOOR(1 + RAND()*6), 
                            'Antonio', 'Manuel', 'Francisco', 'Jose', 'Juan', 'Pedro');
                    WHEN v_decada BETWEEN 1951 AND 1970 THEN
                        SET v_nombre = ELT(FLOOR(1 + RAND()*6), 
                            'Javier', 'Carlos', 'Miguel', 'Angel', 'David', 'Jose Luis');
                    ELSE
                        SET v_nombre = ELT(FLOOR(1 + RAND()*6), 
                            'Alejandro', 'Daniel', 'Pablo', 'Adrian', 'Hugo', 'Martin');
                END CASE;
                
            -- Estados Unidos
            WHEN v_pais_norm = 'US' THEN
                CASE 
                    WHEN v_decada <= 1950 THEN
                        SET v_nombre = ELT(FLOOR(1 + RAND()*6), 
                            'James', 'Robert', 'John', 'William', 'Richard', 'Charles');
                    WHEN v_decada BETWEEN 1951 AND 1970 THEN
                        SET v_nombre = ELT(FLOOR(1 + RAND()*6), 
                            'Michael', 'David', 'Thomas', 'Joseph', 'Mark', 'Steven');
                    ELSE
                        SET v_nombre = ELT(FLOOR(1 + RAND()*6), 
                            'Christopher', 'Jason', 'Matthew', 'Brian', 'Kevin', 'Joshua');
                END CASE;
                
            -- Por defecto (nombres internacionales)
            ELSE
                SET v_nombre = ELT(FLOOR(1 + RAND()*10),
                    'Carlos', 'Luis', 'Jose', 'Miguel', 'Alejandro',
                    'David', 'Daniel', 'Javier', 'Fernando', 'Santiago');
        END CASE;
        
    ELSE -- Género femenino
        -- Nombres de mujer
        CASE 
            -- México
            WHEN v_pais_norm = 'MX' THEN
                CASE 
                    WHEN v_decada <= 1950 THEN
                        SET v_nombre = ELT(FLOOR(1 + RAND()*8), 
                            'Maria', 'Guadalupe', 'Josefina', 'Carmen', 'Rosa', 'Ana', 'Martha', 'Teresa');
                    WHEN v_decada BETWEEN 1951 AND 1970 THEN
                        SET v_nombre = ELT(FLOOR(1 + RAND()*8), 
                            'Maria Elena', 'Maria del Carmen', 'Patricia', 'Silvia', 'Laura', 'Veronica', 'Leticia', 'Sandra');
                    WHEN v_decada BETWEEN 1971 AND 1990 THEN
                        SET v_nombre = ELT(FLOOR(1 + RAND()*8), 
                            'Claudia', 'Monica', 'Alejandra', 'Gabriela', 'Liliana', 'Diana', 'Norma', 'Elizabeth');
                    WHEN v_decada BETWEEN 1991 AND 2010 THEN
                        SET v_nombre = ELT(FLOOR(1 + RAND()*8), 
                            'Jessica', 'Brenda', 'Karen', 'Melissa', 'Daniela', 'Paola', 'Fernanda', 'Andrea');
                    ELSE
                        SET v_nombre = ELT(FLOOR(1 + RAND()*8), 
                            'Sofia', 'Valentina', 'Regina', 'Ximena', 'Camila', 'Renata', 'Victoria', 'Mariana');
                END CASE;
                
            -- España
            WHEN v_pais_norm = 'ES' THEN
                CASE 
                    WHEN v_decada <= 1950 THEN
                        SET v_nombre = ELT(FLOOR(1 + RAND()*6), 
                            'Maria', 'Carmen', 'Josefa', 'Ana', 'Isabel', 'Dolores');
                    WHEN v_decada BETWEEN 1951 AND 1970 THEN
                        SET v_nombre = ELT(FLOOR(1 + RAND()*6), 
                            'Maria Angeles', 'Maria Teresa', 'Cristina', 'Marta', 'Elena', 'Raquel');
                    ELSE
                        SET v_nombre = ELT(FLOOR(1 + RAND()*6), 
                            'Lucia', 'Sofia', 'Paula', 'Sara', 'Claudia', 'Alba');
                END CASE;
                
            -- Estados Unidos
            WHEN v_pais_norm = 'US' THEN
                CASE 
                    WHEN v_decada <= 1950 THEN
                        SET v_nombre = ELT(FLOOR(1 + RAND()*6), 
                            'Mary', 'Patricia', 'Linda', 'Barbara', 'Elizabeth', 'Jennifer');
                    WHEN v_decada BETWEEN 1951 AND 1970 THEN
                        SET v_nombre = ELT(FLOOR(1 + RAND()*6), 
                            'Susan', 'Karen', 'Nancy', 'Lisa', 'Margaret', 'Betty');
                    ELSE
                        SET v_nombre = ELT(FLOOR(1 + RAND()*6), 
                            'Jessica', 'Ashley', 'Emily', 'Sarah', 'Samantha', 'Amanda');
                END CASE;
                
            -- Por defecto (nombres internacionales)
            ELSE
                SET v_nombre = ELT(FLOOR(1 + RAND()*10),
                    'Ana', 'Maria', 'Sofia', 'Laura', 'Valeria',
                    'Fernanda', 'Gabriela', 'Daniela', 'Paola', 'Camila');
        END CASE;
    END IF;
    
    -- Lógica adicional: nombres compuestos (30% de probabilidad)
    IF v_probabilidad < 0.3 AND POSITION(' ' IN v_nombre) = 0 THEN
        -- Agregar segundo nombre común según género
        IF v_genero_norm = 'H' THEN
            SET v_nombre = CONCAT(v_nombre, ' ', 
                ELT(FLOOR(1 + RAND()*5), 'Alberto', 'Angel', 'Manuel', 'Antonio', 'Jose'));
        ELSE
            SET v_nombre = CONCAT(v_nombre, ' ', 
                ELT(FLOOR(1 + RAND()*5), 'Maria', 'Elena', 'Isabel', 'Guadalupe', 'Fernanda'));
        END IF;
    END IF;
    
    -- Lógica de popularidad: algunos nombres son más comunes que otros
    -- Esto ya está implícito en las listas por década
    
    -- Registrar generación (simulado para estadísticas)
    -- INSERT INTO logs_nombres (nombre, genero, pais, anio_nacimiento, fecha_generacion)
    -- VALUES (v_nombre, v_genero_norm, v_pais_norm, v_anio, NOW());
    
    RETURN v_nombre;
    
END