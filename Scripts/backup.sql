--Abrir RMAN
rman target /

--Backup incremental
BACKUP INCREMENTAL LEVEL 1 
DATABASE 
FORMAT '/mnt/Disco_Backups/incremental_%U.bkp';

--Validar Backup
LIST BACKUP SUMMARY;

-- CREACIÓN CRON JOB PARA AUTOMATIZAR BACKUP PERIODICAMENTE.
--Abrir archivo Cron
crontab -e

--Agregar un Job
0 2 * * * /path_to_oracle/rman target / @/path_to_script/backup_incremental.rman
