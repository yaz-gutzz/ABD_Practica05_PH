CREATE DEFINER=`root`@`localhost` FUNCTION `fn_titulo_cortesia`(p_genero VARCHAR(3)) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    IF p_genero = 'H' THEN
        RETURN ELT(FLOOR(1 + RAND()*3),
            'Sr.',
            'Dr.',
            'Ing.'
        );

    ELSEIF p_genero = 'M' THEN
        RETURN ELT(FLOOR(1 + RAND()*3),
            'Sra.',
            'Dra.',
            'Ing.'
        );

    ELSE
        
        RETURN ELT(FLOOR(1 + RAND()*2),
            'Mx.',
            'Ing.'
        );
    END IF;
END