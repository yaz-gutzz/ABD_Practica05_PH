CREATE DEFINER=`root`@`localhost` FUNCTION `fn_estatus_medico`(p_estatus VARCHAR(50)) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    
    IF p_estatus IS NOT NULL AND 
       p_estatus IN ('Estable',
                     'En Observacion',
                     'Coma',
                     'Estado Vegetativo',
                     'Cuidados Paliativos') THEN
        RETURN p_estatus;
    END IF;

    
    RETURN ELT(FLOOR(1 + RAND()*5),
        'Estable',
        'En Observacion',
        'Coma',
        'Estado Vegetativo',
        'Cuidados Paliativos'
    );
END