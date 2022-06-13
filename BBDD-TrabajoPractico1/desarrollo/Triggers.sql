DELIMITER $$
CREATE TRIGGER after_insert_liquidacionAjuste
AFTER INSERT ON liquidacionAjuste
FOR EACH ROW
BEGIN
	DECLARE id INT;
    SET id = (SELECT a.id_cambio FROM liquidacionAjuste AS a WHERE a.id_participante = NEW.id_participante);
	
    INSERT INTO ingreso_de_horas(id_participante, cambios_hora)
		VALUES(NEW.id_participante, NEW.cambios_hora);
    
    UPDATE liquidacion 
    SET id_cambios_hora = id 
    WHERE id_participante = new.id_participante;
END;$$
DELIMITER ;