CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_curp_real`(
    p_nombre VARCHAR(50),
    p_apellido_p VARCHAR(50),
    p_apellido_m VARCHAR(50),
    p_genero VARCHAR(3),
    p_fecha DATE
) RETURNS varchar(30) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN CONCAT(
        UPPER(LEFT(p_apellido_p,1)),
        UPPER(LEFT(p_apellido_m,1)),
        UPPER(LEFT(p_nombre,1)),
        DATE_FORMAT(p_fecha,'%y%m%d'),
        REPLACE(p_genero,'/',''),
        SUBSTRING(REPLACE(UUID(),'-',''),1,6)
    );
END