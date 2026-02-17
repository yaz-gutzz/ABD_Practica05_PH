CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_genero`(p_genero VARCHAR(3)) RETURNS varchar(3) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    
    IF p_genero IS NOT NULL 
       AND p_genero IN ('H','M','N/B') THEN
        RETURN p_genero;
    END IF;

    
    RETURN ELT(FLOOR(1 + RAND()*3),
        'H',
        'M',
        'N/B'
    );
END