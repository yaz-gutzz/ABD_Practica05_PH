CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblar_pacientes_goog`(
    IN p_cantidad INT,
    IN p_genero VARCHAR(3),
    IN p_edad_min INT,
    IN p_edad_max INT,
    IN p_estatus_vida VARCHAR(20),
    IN p_estatus_medico VARCHAR(50)   
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE batch_size INT DEFAULT 5000;

    DECLARE v_id_persona INT;
    DECLARE v_edad INT;
    DECLARE v_fecha_nac DATE;
    DECLARE v_genero VARCHAR(3);

    DECLARE v_nombre VARCHAR(50);
    DECLARE v_apellido_p VARCHAR(50);
    DECLARE v_apellido_m VARCHAR(50);

    SET p_edad_min = IFNULL(p_edad_min,0);
    SET p_edad_max = IFNULL(p_edad_max,120);

    START TRANSACTION;

    WHILE i < p_cantidad DO

        SET v_edad = fn_generar_edad(p_edad_min,p_edad_max);
        SET v_fecha_nac = DATE_SUB(CURDATE(), INTERVAL v_edad YEAR);
        SET v_genero = fn_generar_genero(p_genero);

        SET v_nombre     = fn_nombre_real();
        SET v_apellido_p = fn_apellido_real();
        SET v_apellido_m = fn_apellido_real();

        
        INSERT INTO tbb_personas(
            tipo,
            rfc,
            pais_origen,
            fecha_actualizacion
        )
        VALUES(
            'Fisica',
            fn_generar_rfc_real(
                v_nombre,
                v_apellido_p,
                v_apellido_m,
                v_fecha_nac
            ),
            fn_pais_origen(),
            NOW()
        );

        SET v_id_persona = LAST_INSERT_ID();

        
        INSERT INTO tbb_personas_fisicas(
            ID,
            titulo_cortesia,
            nombre,
            primer_apellido,
            segundo_apellido,
            genero,
            fecha_nacimiento,
            curp,
            grupo_sanguineo
        )
        VALUES(
            v_id_persona,
            fn_titulo_cortesia(v_genero),
            v_nombre,
            v_apellido_p,
            v_apellido_m,
            v_genero,
            v_fecha_nac,
            fn_generar_curp_real(
                v_nombre,
                v_apellido_p,
                v_apellido_m,
                v_genero,
                v_fecha_nac
            ),
            fn_grupo_sanguineo()
        );

        
        INSERT INTO tbb_pacientes(
            ID,
            estatus_medico,
            estatus_vida,
            fecha_ultima_citamedica
        )
        VALUES(
            v_id_persona,
            fn_estatus_medico(p_estatus_medico),  
            fn_estatus_vida(p_estatus_vida),
            fn_fecha_ultima_cita()
        );

        SET i = i + 1;

        IF i % batch_size = 0 THEN
            COMMIT;
            START TRANSACTION;
        END IF;

    END WHILE;

    COMMIT;

END