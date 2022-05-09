INSERT INTO cliente(nombre, presupuesto)
VALUES	('A', 1000000),
        ('B', 2000000),
	('C', 3000000),
	('D', 4000000);

INSERT INTO proyecto(proyecto_nombre, id_cliente)
VALUES	('ProyectoA', 1),
	('ProyectoB', 2),
         ('ProyectoC', 3),
         ('ProyectoD', 4);

INSERT INTO diff_rol(rol_nombre)
VALUES	('Project Manager'),
	('Tester'),
	('Administrador'),
	('Desarrollador'),
         ('DevOps');

INSERT INTO legajo(nombre, apellido, dni)
VALUES	('Mariano', 'Pinto', 20765890),
	('Armando', 'Casas', 23098521),
         ('Maria', 'Gomez', 40333888),
         ('Jose', 'Dias', 33777999),
         ('Ana', 'Wigenhouse', 35789543);
    
INSERT INTO participante(id_proyecto, id_rol, id_legajo, horas_de_trabajo, horas_mensuales_trabajo)
VALUES 	(1, 5, 1, 1, 20), 
	(2, 4, 2, 2, 40),
	(3, 3, 3, 3, 60),
	(4, 2, 4, 4, 80),
	(1, 1, 5, 5, 100);