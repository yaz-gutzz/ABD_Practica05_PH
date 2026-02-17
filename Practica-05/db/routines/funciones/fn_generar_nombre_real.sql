CREATE DEFINER=`root`@`localhost` FUNCTION `fn_nombre_real`() RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN ELT(FLOOR(1 + RAND()*10),
        'Carlos','Luis','Ana','Maria','Jose',
        'Fernanda','Miguel','Sofia','Diego','Valeria'
    );
END