CREATE DEFINER=`root`@`localhost` FUNCTION `fn_titulo_cortesia`(
    p_genero VARCHAR(3),
    p_profesion VARCHAR(50),
    p_edad INT,
    p_contexto VARCHAR(30)
) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
    COMMENT 'Función fn_titulo_cortesia - Desarrollada por el equipo de PH, Farmacia'
BEGIN
    DECLARE v_titulo VARCHAR(20);
    DECLARE v_genero_norm VARCHAR(1);
    DECLARE v_profesion_norm VARCHAR(50);
    DECLARE v_edad_norm INT;
    DECLARE v_contexto_norm VARCHAR(30);
    DECLARE v_probabilidad FLOAT;
    
    -- Normalizar parámetros de entrada
    SET v_probabilidad = RAND();
    
    -- Normalizar género
    IF p_genero IS NOT NULL AND TRIM(p_genero) != '' THEN
        SET p_genero = UPPER(TRIM(p_genero));
        SET v_genero_norm = CASE 
            WHEN p_genero IN ('H', 'MASCULINO', 'HOMBRE', 'MALE') THEN 'H'
            WHEN p_genero IN ('M', 'FEMENINO', 'MUJER', 'FEMALE') THEN 'M'
            ELSE 'X'
        END;
    ELSE
        SET v_genero_norm = 'X';
    END IF;
    
    -- Normalizar profesión
    IF p_profesion IS NOT NULL AND TRIM(p_profesion) != '' THEN
        SET v_profesion_norm = UPPER(TRIM(p_profesion));
    ELSE
        SET v_profesion_norm = '';
    END IF;
    
    -- Normalizar edad
    IF p_edad IS NOT NULL AND p_edad > 0 AND p_edad < 120 THEN
        SET v_edad_norm = p_edad;
    ELSE
        SET v_edad_norm = 30; -- Edad por defecto
    END IF;
    
    -- Normalizar contexto
    IF p_contexto IS NOT NULL AND TRIM(p_contexto) != '' THEN
        SET v_contexto_norm = UPPER(TRIM(p_contexto));
    ELSE
        SET v_contexto_norm = 'GENERAL';
    END IF;
    
    -- Primero, verificar si hay una profesión específica que determine el título
    IF v_profesion_norm != '' THEN
        -- Títulos académicos y profesionales
        CASE 
            WHEN v_profesion_norm IN ('MEDICO', 'MEDICA', 'DOCTOR', 'DOCTORA', 'MÉDICO', 'MÉDICA', 'CIRUJANO', 'CIRUJANA') THEN
                IF v_genero_norm = 'H' THEN
                    SET v_titulo = 'Dr.';
                ELSEIF v_genero_norm = 'M' THEN
                    SET v_titulo = 'Dra.';
                ELSE
                    SET v_titulo = ELT(FLOOR(1 + RAND()*2), 'Dr.', 'Dra.');
                END IF;
                
            WHEN v_profesion_norm IN ('INGENIERO', 'INGENIERA', 'ING') THEN
                SET v_titulo = 'Ing.';
                
            WHEN v_profesion_norm IN ('LICENCIADO', 'LICENCIADA', 'LIC') THEN
                SET v_titulo = 'Lic.';
                
            WHEN v_profesion_norm IN ('ARQUITECTO', 'ARQUITECTA', 'ARQ') THEN
                SET v_titulo = 'Arq.';
                
            WHEN v_profesion_norm IN ('PROFESOR', 'PROFESORA', 'MAESTRO', 'MAESTRA', 'DOCENTE') THEN
                SET v_titulo = 'Prof.';
                
            WHEN v_profesion_norm IN ('ABOGADO', 'ABOGADA', 'LICENCIADO EN DERECHO') THEN
                IF v_genero_norm = 'H' THEN
                    SET v_titulo = 'Lic.';
                ELSEIF v_genero_norm = 'M' THEN
                    SET v_titulo = 'Licda.';
                ELSE
                    SET v_titulo = 'Lic.';
                END IF;
                
            WHEN v_profesion_norm IN ('PSICOLOGO', 'PSICOLOGA', 'PSIC') THEN
                IF v_genero_norm = 'H' THEN
                    SET v_titulo = 'Psic.';
                ELSEIF v_genero_norm = 'M' THEN
                    SET v_titulo = 'Psica.';
                ELSE
                    SET v_titulo = 'Psic.';
                END IF;
                
            WHEN v_profesion_norm IN ('ENFERMERO', 'ENFERMERA') THEN
                IF v_genero_norm = 'H' THEN
                    SET v_titulo = 'Enf.';
                ELSEIF v_genero_norm = 'M' THEN
                    SET v_titulo = 'Enfa.';
                ELSE
                    SET v_titulo = 'Enf.';
                END IF;
        END CASE;
    END IF;
    
    -- Si no se asignó título por profesión, usar lógica por contexto
    IF v_titulo IS NULL THEN
        CASE v_contexto_norm
            WHEN 'HOSPITAL', 'CLINICA', 'MEDICO', 'SALUD' THEN
                -- Contexto médico/salud
                IF v_probabilidad < 0.4 THEN
                    -- Títulos médicos
                    IF v_genero_norm = 'H' THEN
                        SET v_titulo = 'Dr.';
                    ELSEIF v_genero_norm = 'M' THEN
                        SET v_titulo = 'Dra.';
                    ELSE
                        SET v_titulo = ELT(FLOOR(1 + RAND()*2), 'Dr.', 'Dra.');
                    END IF;
                ELSEIF v_probabilidad < 0.7 THEN
                    SET v_titulo = 'Ing.';
                ELSE
                    -- Títulos generales por género
                    IF v_genero_norm = 'H' THEN
                        SET v_titulo = 'Sr.';
                    ELSEIF v_genero_norm = 'M' THEN
                        SET v_titulo = 'Sra.';
                    ELSE
                        SET v_titulo = 'Mx.';
                    END IF;
                END IF;
                
            WHEN 'EMPRESA', 'CORPORATIVO', 'NEGOCIOS' THEN
                -- Contexto empresarial
                IF v_probabilidad < 0.3 THEN
                    SET v_titulo = 'Ing.';
                ELSEIF v_probabilidad < 0.6 THEN
                    SET v_titulo = 'Lic.';
                ELSE
                    IF v_genero_norm = 'H' THEN
                        SET v_titulo = 'Sr.';
                    ELSEIF v_genero_norm = 'M' THEN
                        SET v_titulo = 'Sra.';
                    ELSE
                        SET v_titulo = 'Mx.';
                    END IF;
                END IF;
                
            WHEN 'UNIVERSIDAD', 'ACADEMICO', 'EDUCACION' THEN
                -- Contexto académico
                IF v_probabilidad < 0.4 THEN
                    IF v_genero_norm = 'H' THEN
                        SET v_titulo = 'Dr.';
                    ELSEIF v_genero_norm = 'M' THEN
                        SET v_titulo = 'Dra.';
                    ELSE
                        SET v_titulo = ELT(FLOOR(1 + RAND()*2), 'Dr.', 'Dra.');
                    END IF;
                ELSEIF v_probabilidad < 0.7 THEN
                    SET v_titulo = 'Prof.';
                ELSE
                    SET v_titulo = 'Lic.';
                END IF;
                
            WHEN 'FORMAL', 'PROTOCOLO', 'CEREMONIA' THEN
                -- Contexto formal
                IF v_genero_norm = 'H' THEN
                    SET v_titulo = 'Sr.';
                ELSEIF v_genero_norm = 'M' THEN
                    SET v_titulo = 'Sra.';
                ELSE
                    SET v_titulo = 'Mx.';
                END IF;
                
            WHEN 'INFORMAL', 'CASUAL' THEN
                -- Contexto informal (sin título)
                SET v_titulo = '';
                
            ELSE -- GENERAL
                -- Lógica por edad
                IF v_edad_norm < 18 THEN
                    -- Menores de edad
                    IF v_genero_norm = 'H' THEN
                        SET v_titulo = 'Srto.';
                    ELSEIF v_genero_norm = 'M' THEN
                        SET v_titulo = 'Srta.';
                    ELSE
                        SET v_titulo = 'Mx.';
                    END IF;
                    
                ELSEIF v_edad_norm BETWEEN 18 AND 30 THEN
                    -- Adultos jóvenes
                    IF v_probabilidad < 0.3 THEN
                        IF v_genero_norm = 'H' THEN
                            SET v_titulo = 'Sr.';
                        ELSEIF v_genero_norm = 'M' THEN
                            SET v_titulo = 'Sra.';
                        ELSE
                            SET v_titulo = 'Mx.';
                        END IF;
                    ELSEIF v_probabilidad < 0.6 THEN
                        SET v_titulo = 'Ing.';
                    ELSE
                        SET v_titulo = 'Lic.';
                    END IF;
                    
                ELSEIF v_edad_norm BETWEEN 31 AND 60 THEN
                    -- Adultos
                    IF v_probabilidad < 0.25 THEN
                        IF v_genero_norm = 'H' THEN
                            SET v_titulo = 'Sr.';
                        ELSEIF v_genero_norm = 'M' THEN
                            SET v_titulo = 'Sra.';
                        ELSE
                            SET v_titulo = 'Mx.';
                        END IF;
                    ELSEIF v_probabilidad < 0.5 THEN
                        SET v_titulo = 'Ing.';
                    ELSEIF v_probabilidad < 0.75 THEN
                        SET v_titulo = 'Lic.';
                    ELSE
                        IF v_genero_norm = 'H' THEN
                            SET v_titulo = 'Dr.';
                        ELSEIF v_genero_norm = 'M' THEN
                            SET v_titulo = 'Dra.';
                        ELSE
                            SET v_titulo = ELT(FLOOR(1 + RAND()*2), 'Dr.', 'Dra.');
                        END IF;
                    END IF;
                    
                ELSE
                    -- Adultos mayores
                    IF v_probabilidad < 0.5 THEN
                        IF v_genero_norm = 'H' THEN
                            SET v_titulo = 'Sr.';
                        ELSEIF v_genero_norm = 'M' THEN
                            SET v_titulo = 'Sra.';
                        ELSE
                            SET v_titulo = 'Mx.';
                        END IF;
                    ELSEIF v_probabilidad < 0.8 THEN
                        IF v_genero_norm = 'H' THEN
                            SET v_titulo = 'Dr.';
                        ELSEIF v_genero_norm = 'M' THEN
                            SET v_titulo = 'Dra.';
                        ELSE
                            SET v_titulo = ELT(FLOOR(1 + RAND()*2), 'Dr.', 'Dra.');
                        END IF;
                    ELSE
                        SET v_titulo = 'Prof.';
                    END IF;
                END IF;
        END CASE;
    END IF;
    
    -- Si aún no hay título, usar valores por defecto según género
    IF v_titulo IS NULL OR v_titulo = '' THEN
        IF v_genero_norm = 'H' THEN
            SET v_titulo = ELT(FLOOR(1 + RAND()*3), 'Sr.', 'Ing.', 'Lic.');
        ELSEIF v_genero_norm = 'M' THEN
            SET v_titulo = ELT(FLOOR(1 + RAND()*3), 'Sra.', 'Ing.', 'Lic.');
        ELSE
            SET v_titulo = ELT(FLOOR(1 + RAND()*2), 'Mx.', 'Ing.');
        END IF;
    END IF;
    
    -- Registrar generación (simulado para estadísticas)
    -- INSERT INTO logs_titulos (titulo, genero, profesion, edad, contexto, fecha_generacion)
    -- VALUES (v_titulo, v_genero_norm, v_profesion_norm, v_edad_norm, v_contexto_norm, NOW());
    
    RETURN v_titulo;
    
END