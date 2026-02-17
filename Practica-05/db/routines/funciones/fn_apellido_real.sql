CREATE DEFINER=`root`@`localhost` FUNCTION `fn_apellido_real`() RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN ELT(FLOOR(1 + RAND()*10),
        'Garcia','Lopez','Martinez','Hernandez','Perez',
        'Gomez','Torres','Ramirez','Flores','Sanchez'
    );
END