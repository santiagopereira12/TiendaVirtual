--Conectar RMAN y apagar la base de datos
rman target /
--Al ingresar ejecutamos
SHUTDOWN IMMEDIATE;
STARTUP MOUNT;

--Iniciamos la restauración punto en el tiempo
RUN {
    SET UNTIL TIME "TO_DATE('2024-09-05 10:00:00', '2024-06-15 23:59:59')";
    RESTORE DATABASE;
    RECOVER DATABASE;
}

--Abrir la DB en modo RESETLOG
ALTER DATABASE OPEN RESETLOGS;

--Generamos un backup completo
BACKUP DATABASE;

