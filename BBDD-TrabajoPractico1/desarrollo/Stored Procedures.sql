DELIMITER $$

CREATE PROCEDURE sumarHorasDeProyecto(IN id_proyecto INT, IN horas INT)
BEGIN
   DECLARE sumaDeHoras INT;
   SET sumaDeHoras = (SELECT SUM(a.horas_de_trabajo) FROM proyecto AS a WHERE a.id_proyecto = id_proyecto) + horas;
   UPDATE proyecto AS a SET a.horas_de_trabajo = sumaDeHoras WHERE a.id_proyecto = id_proyecto;
END$$

DELIMITER ;

/*--*/

DELIMITER $$

CREATE PROCEDURE rendicionDeHorasDiarias(IN id_proyecto INT, IN horas INT, IN id_participante INT)
BEGIN
    DECLARE horasDiarias INT;
    CALL sumarHorasDeProyecto(id_proyecto, horas);
    SET horasDiarias = (SELECT SUM(a.diario) FROM ingreso_de_horas AS a WHERE a.id_participante = id_participante) + horas;
    UPDATE ingreso_de_horas AS a SET a.diario = horasDiarias WHERE a.id_participante = id_participante;
END$$

DELIMITER ;

/*---*/

DELIMITER $$

CREATE PROCEDURE rendicionDeHorasSemanales(IN id_proyecto INT, IN horas INT, IN id_participante INT)
BEGIN
    DECLARE horasSemanales INT;
    CALL sumarHorasDeProyecto(id_proyecto, horas);
    SET horasSemanales = (SELECT SUM(a.semanal) FROM ingreso_de_horas AS a WHERE a.id_participante = id_participante) + horas;
    UPDATE ingreso_de_horas AS a SET a.semanal = horaSemanal WHERE a.id_participante = id_participante;
END$$

DELIMITER ;

/*--*/

DELIMITER $$ 

CREATE PROCEDURE rendicionDeHorasMensuales(IN id_proyecto INT, IN horas INT, IN id_participante INT)
BEGIN
    DECLARE horasMensuales INT;
    CALL sumarHorasDeProyecto(id_proyecto, horas);
    SET horasMensuales = (SELECT SUM(a.mesnsual) FROM ingreso_de_horas AS a WHERE a.id_participante = id_participante) + horas;
    UPDATE ingreso_de_horas AS a SET a.mensual = horasMensuales WHERE a.id_participante = id_participante;
END$$

DELIMITER ;

/*-----*/

DELIMITER $$

CREATE PROCEDURE calcularLiquidacionMensual(IN id_proyecto INT)
BEGIN
    DECLARE liquidacion INT;
    DECLARE nombre_proyecto VARCHAR(225);
    
    SET liquidacion = (SELECT a.horas_de_trabajo FROM proyecto AS a WHERE a.id_proyecto = id_proyecto);
	 
    SET nombre_proyecto = (SELECT a.nombre_proyecto FROM proyecto AS a WHERE a.id_proyecto = id_proyecto);
    
    INSERT INTO liquidacion(id_proyecto, proyecto_nombre, total_de_horas) VALUES(id_proyecto, nombre_proyecto, liquidacion);
	
    SELECT * FROM liquidacion;

END$$

DELIMITER ;
