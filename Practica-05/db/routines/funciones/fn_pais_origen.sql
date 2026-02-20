CREATE DEFINER=`root`@`localhost` FUNCTION `fn_pais_origen`(
    p_continente VARCHAR(20),
    p_idioma VARCHAR(20),
    p_tipo_paciente VARCHAR(30)
) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
    COMMENT 'Función fn_pais_origen - Desarrollada por el equipo de PH, Farmacia'
BEGIN
    DECLARE v_pais VARCHAR(50);
    DECLARE v_continente_norm VARCHAR(20);
    DECLARE v_idioma_norm VARCHAR(20);
    DECLARE v_tipo_paciente_norm VARCHAR(30);
    DECLARE v_probabilidad FLOAT;
    DECLARE v_indice INT;
    
    -- Normalizar parámetros de entrada
    SET v_continente_norm = UPPER(COALESCE(p_continente, ''));
    SET v_idioma_norm = UPPER(COALESCE(p_idioma, ''));
    SET v_tipo_paciente_norm = UPPER(COALESCE(p_tipo_paciente, ''));
    SET v_probabilidad = RAND();
    
    -- Si se especificó continente, filtrar por continente
    IF v_continente_norm IN ('AMERICA', 'AMÉRICA', 'LATAM', 'LATINOAMERICA', 'CENTROAMERICA', 'SURAMERICA', 'NORTEAMERICA') THEN
        -- América Latina y Caribe
        CASE 
            WHEN v_continente_norm IN ('NORTEAMERICA', 'NORTH AMERICA') THEN
                SET v_pais = ELT(FLOOR(1 + RAND()*3), 'México', 'Estados Unidos', 'Canadá');
            WHEN v_continente_norm IN ('CENTROAMERICA', 'CENTRAL AMERICA') THEN
                SET v_pais = ELT(FLOOR(1 + RAND()*7), 
                    'Guatemala', 'Honduras', 'El Salvador', 'Nicaragua', 'Costa Rica', 'Panamá', 'Belice');
            WHEN v_continente_norm IN ('SURAMERICA', 'SOUTH AMERICA') THEN
                SET v_pais = ELT(FLOOR(1 + RAND()*10),
                    'Brasil', 'Argentina', 'Colombia', 'Chile', 'Perú', 
                    'Venezuela', 'Ecuador', 'Bolivia', 'Paraguay', 'Uruguay');
            WHEN v_continente_norm IN ('CARIBE', 'CARIBBEAN') THEN
                SET v_pais = ELT(FLOOR(1 + RAND()*5),
                    'Cuba', 'República Dominicana', 'Puerto Rico', 'Haití', 'Jamaica');
            ELSE -- LATAM genérico
                SET v_pais = ELT(FLOOR(1 + RAND()*8),
                    'México', 'Colombia', 'Argentina', 'Chile', 'Perú', 
                    'Venezuela', 'Ecuador', 'Brasil');
        END CASE;
        
    ELSEIF v_continente_norm IN ('EUROPA', 'EUROPE', 'UE', 'EU') THEN
        -- Europa
        SET v_pais = ELT(FLOOR(1 + RAND()*10),
            'España', 'Italia', 'Francia', 'Alemania', 'Reino Unido',
            'Portugal', 'Países Bajos', 'Bélgica', 'Suiza', 'Suecia');
            
    ELSEIF v_continente_norm IN ('ASIA', 'ASIAN', 'ORIENTE') THEN
        -- Asia
        SET v_pais = ELT(FLOOR(1 + RAND()*8),
            'China', 'Japón', 'Corea del Sur', 'India', 'Filipinas',
            'Vietnam', 'Tailandia', 'Indonesia');
            
    ELSEIF v_continente_norm IN ('AFRICA', 'ÁFRICA') THEN
        -- África
        SET v_pais = ELT(FLOOR(1 + RAND()*6),
            'Nigeria', 'Egipto', 'Sudáfrica', 'Kenia', 'Marruecos', 'Angola');
            
    ELSEIF v_continente_norm IN ('OCEANIA', 'OCEANÍA') THEN
        -- Oceanía
        SET v_pais = ELT(FLOOR(1 + RAND()*4),
            'Australia', 'Nueva Zelanda', 'Fiyi', 'Papúa Nueva Guinea');
            
    ELSE
        -- Si no hay filtro por continente, usar otros criterios
        
        -- Filtrar por idioma si se especificó
        IF v_idioma_norm IN ('ESPAÑOL', 'SPANISH', 'CASTELLANO') THEN
            -- Países hispanohablantes
            SET v_pais = ELT(FLOOR(1 + RAND()*12),
                'México', 'Colombia', 'Argentina', 'España', 'Chile', 'Perú',
                'Venezuela', 'Ecuador', 'Guatemala', 'Cuba', 'Bolivia', 'República Dominicana');
                
        ELSEIF v_idioma_norm IN ('INGLES', 'ENGLISH') THEN
            -- Países angloparlantes
            SET v_pais = ELT(FLOOR(1 + RAND()*6),
                'Estados Unidos', 'Reino Unido', 'Canadá', 'Australia', 'Nueva Zelanda', 'Irlanda');
                
        ELSEIF v_idioma_norm IN ('PORTUGUES', 'PORTUGUESE') THEN
            -- Países lusófonos
            SET v_pais = ELT(FLOOR(1 + RAND()*3),
                'Brasil', 'Portugal', 'Angola');
                
        ELSEIF v_idioma_norm IN ('FRANCES', 'FRENCH') THEN
            -- Países francófonos
            SET v_pais = ELT(FLOOR(1 + RAND()*4),
                'Francia', 'Canadá', 'Bélgica', 'Suiza');
                
        ELSE
            -- Filtrar por tipo de paciente si se especificó
            IF v_tipo_paciente_norm IN ('TURISTA', 'VIAJERO', 'EXTRANJERO') THEN
                -- Pacientes internacionales (mayor variabilidad)
                SET v_pais = ELT(FLOOR(1 + RAND()*15),
                    'México', 'Colombia', 'Argentina', 'Chile', 'Perú',
                    'España', 'Estados Unidos', 'Canadá', 'Brasil', 'Francia',
                    'Italia', 'Alemania', 'Japón', 'China', 'Reino Unido');
                    
            ELSEIF v_tipo_paciente_norm IN ('REFUGIADO', 'MIGRANTE', 'DESPLAZADO') THEN
                -- Países con alta migración
                SET v_pais = ELT(FLOOR(1 + RAND()*6),
                    'Venezuela', 'Honduras', 'El Salvador', 'Guatemala', 'Siria', 'Afganistán');
                    
            ELSEIF v_tipo_paciente_norm IN ('RESIDENTE', 'LOCAL', 'NACIONAL') THEN
                -- Mayoría local (México como base)
                IF v_probabilidad < 0.8 THEN
                    SET v_pais = 'México';
                ELSE
                    SET v_pais = ELT(FLOOR(1 + RAND()*4), 'México', 'México', 'México', ELT(FLOOR(1 + RAND()*5),
                        'Colombia', 'Argentina', 'Chile', 'Perú', 'España'));
                END IF;
                
            ELSE
                -- Distribución por probabilidad realista de pacientes en Latinoamérica
                -- Basado en flujos migratorios y turismo
                SET v_indice = FLOOR(1 + RAND()*100);
                CASE 
                    WHEN v_indice <= 40 THEN SET v_pais = 'México';
                    WHEN v_indice <= 55 THEN SET v_pais = 'Colombia';
                    WHEN v_indice <= 65 THEN SET v_pais = 'Argentina';
                    WHEN v_indice <= 75 THEN SET v_pais = 'Perú';
                    WHEN v_indice <= 83 THEN SET v_pais = 'Chile';
                    WHEN v_indice <= 90 THEN SET v_pais = 'Venezuela';
                    WHEN v_indice <= 95 THEN SET v_pais = 'Ecuador';
                    WHEN v_indice <= 98 THEN SET v_pais = 'España';
                    ELSE SET v_pais = ELT(FLOOR(1 + RAND()*7),
                        'Brasil', 'Estados Unidos', 'Canadá', 'Francia', 'Italia', 'Alemania', 'Reino Unido');
                END CASE;
            END IF;
        END IF;
    END IF;
    
    -- Validación final y limpieza
    SET v_pais = TRIM(v_pais);
    
    -- Registrar generación (simulado para estadísticas)
    -- INSERT INTO logs_pais_origen (pais, continente, idioma, tipo_paciente, fecha_generacion)
    -- VALUES (v_pais, v_continente_norm, v_idioma_norm, v_tipo_paciente_norm, NOW());
    
    RETURN v_pais;
    
END