CREATE DEFINER=`root`@`localhost` FUNCTION `fn_apellido_real`() RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
    COMMENT 'Función fn_apellido_real - Desarrollada por el equipo de PH, Farmacia'
BEGIN
    RETURN ELT(FLOOR(1 + RAND()*120),
        -- Apellidos españoles más comunes (1-40)
        'Garcia', 'Lopez', 'Martinez', 'Hernandez', 'Perez',
        'Gomez', 'Torres', 'Ramirez', 'Flores', 'Sanchez',
        'Gonzalez', 'Rodriguez', 'Fernandez', 'Diaz', 'Moreno',
        'Jimenez', 'Ruiz', 'Alvarez', 'Romero', 'Alonso',
        'Gutierrez', 'Navarro', 'Molina', 'Morales', 'Ortega',
        'Delgado', 'Castro', 'Ortiz', 'Rubio', 'Marin',
        'Santos', 'Nunez', 'Iglesias', 'Medina', 'Garrido',
        'Cortes', 'Castillo', 'Lozano', 'Guerrero', 'Mendez',
        
        -- Apellidos latinoamericanos comunes (41-80)
        'Vargas', 'Rios', 'Valdez', 'Cordova', 'Cabrera',
        'Campos', 'Vega', 'Cruz', 'Rojas', 'Mendoza',
        'Soto', 'Paredes', 'Aguilar', 'Salazar', 'Chavez',
        'Castellanos', 'Reyes', 'Herrera', 'Vasquez', 'Munoz',
        'Fuentes', 'Rivera', 'Carrillo', 'Maldonado', 'Caceres',
        'Contreras', 'Bustos', 'Silva', 'Pacheco', 'Valencia',
        'Avila', 'Orozco', 'Guillen', 'Montoya', 'Barrios',
        'Ponce', 'Acosta', 'Zambrano', 'Bravo', 'Miranda',
        
        -- Apellidos adicionales (81-120)
        'Serrano', 'Dominguez', 'Vera', 'Beltran', 'Santiago',
        'Cano', 'Prieto', 'Pascual', 'Gallego', 'Lara',
        'Cordero', 'Merino', 'Rivas', 'Ferrer', 'Vidal',
        'Pastor', 'Parra', 'Crespo', 'Millan', 'Leon',
        'Moya', 'Soriano', 'Pardo', 'Ferreira', 'Espinoza',
        'Benitez', 'Macias', 'Salinas', 'Coronel', 'Velasquez',
        'Godoy', 'Toledo', 'Linares', 'Duarte', 'Montes',
        'Aravena', 'Cepeda', 'Lagos', 'Pinto', 'Sepulveda'
    );
END