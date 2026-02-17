CREATE DEFINER=`root`@`localhost` FUNCTION `fn_pais_origen`() RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN ELT(FLOOR(1 + RAND()*5),
        'Mexico',
        'Colombia',
        'Argentina',
        'Chile',
        'Peru'
    );
END