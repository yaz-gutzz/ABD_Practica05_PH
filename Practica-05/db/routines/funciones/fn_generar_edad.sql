CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_edad`(p_min INT, p_max INT) RETURNS int
    DETERMINISTIC
BEGIN
    RETURN FLOOR(RAND() * (p_max - p_min + 1)) + p_min;
END