CREATE DATABASE TPractico1;
USE TPractico1;

CREATE TABLE cliente(
	 id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(225),
    presupuesto DOUBLE
);

CREATE TABLE proyecto(
	 id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    proyecto_nombre VARCHAR(225) NOT NULL,
    id_cliente INT,
    horas_de_trabajo INT,
    CONSTRAINT f_clientes
      FOREIGN KEY (id_cliente)
		REFERENCES cliente(id_cliente)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT
);

CREATE TABLE diff_rol(
	 id_rol INT AUTO_INCREMENT PRIMARY KEY,
    rol_nombre VARCHAR(225)
);

CREATE TABLE legajo(
	 id_legajo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(225) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    dni INT NOT NULL
);

CREATE TABLE participante(
	 id_participante INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT,
    id_rol INT,
    id_legajo INT,
    horas_de_trabajo INT,
    horas_mensuales_trabajo INT,
    CONSTRAINT f_roles
    	FOREIGN KEY (id_rol)
		REFERENCES diff_rol(id_rol)
		ON UPDATE RESTRICT
      ON DELETE RESTRICT,
   CONSTRAINT f_proyectos
   	FOREIGN KEY (id_proyecto)
		REFERENCES proyecto(id_proyecto)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT,
	CONSTRAINT f_legajos
      FOREIGN KEY (id_legajo)
		REFERENCES legajo(id_legajo)
		ON DELETE RESTRICT
      ON UPDATE RESTRICT
);

CREATE TABLE ingreso_de_horas(
	 id_horas INT AUTO_INCREMENT PRIMARY KEY,
    id_participante INT,
    diario INT,
    semanal INT,
    mensual INT,
    cambios_hora INT,
    CONSTRAINT f_participantes
    	FOREIGN KEY(id_participante)
		REFERENCES participante(id_participante)
		ON DELETE RESTRICT
      ON UPDATE RESTRICT
);

CREATE TABLE cambio_costo_total(
	 id_cambio INT AUTO_INCREMENT PRIMARY KEY,
    id_participante INT,
    cambios_hora INT,
    CONSTRAINT f_participantes_ajusteLiq
      FOREIGN KEY(id_participante)
		REFERENCES participante(id_participante)
		ON DELETE RESTRICT
      ON UPDATE RESTRICT
);

CREATE TABLE costo_total(
	 id_costo INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT,
    id_cambio INT,
    proyecto_nombre VARCHAR(255),
    total_de_horas INT,
	CONSTRAINT f_proyectos_liquidaciones
      FOREIGN KEY (id_proyecto)
	   REFERENCES proyecto(id_proyecto)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT,
	CONSTRAINT f_cambios
      FOREIGN KEY (id_cambio)
		REFERENCES cambio_costo_total(id_cambio)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT
);