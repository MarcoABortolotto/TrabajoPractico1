CREATE USER 'App_carga'@'%' identified BY '123456';
CREATE USER 'liquidador'@'%' IDENTIFIED BY '123456';
CREATE USER 'administrador'@'%' IDENTIFIED BY '123456';


GRANT UPDATE ON tpractico1.ingreso_de_horas TO 'App_carga'@'%';
GRANT INSERT ON tpractico1.liquidacion TO 'liquidador'@'%';
GRANT ALL ON tpractico1.* TO 'administrator'@'%';