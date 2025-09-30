#!/bin/sh
# The above line tells the interpreter this code needs to be run as a shell script.

# Set the database name to a variable. 
DATABASE='sakila'

# This will be printed on to the screen. In the case of cron job, it will be printed to the logs.
echo "Pulling Database: This may take a few minutes"

# Set the folder where the database backup will be stored
backupfolder=/mnt/c/Users/'dg_su/OneDrive - Universidad Tecnologica del Peru'/Estudios/Cursos/'Analisis de Datos'/DATABASE/'Administración de bases de datos relacionales (DBA) IBM'/code/'15_Automatización de tareas en MySQL mediante scripts de shell'/backups

if [ ! -d "$backupfolder" ]; then 
    mkdir "$backupfolder"
fi

# Number of days to store the backup 
keep_day=30

sqlfile=$backupfolder/all-database-$(date +%d-%m-%Y_%H-%M-%S).sql
zipfile=$backupfolder/all-database-$(date +%d-%m-%Y_%H-%M-%S).gz

# Create a backup

if mysqldump "$DATABASE" > "$sqlfile" ; then
   echo 'Sql dump created'
    # Compress backup 
    if gzip -c "$sqlfile" > "$zipfile"; then
        echo "The backup was successfully compressed  $(date)"
    else
        echo "Error compressing backupBackup was not created!  $(date)"
        exit
    fi
    rm "$sqlfile" 
else
   echo "mysqldump return non-zero code No backup was created!  $(date)" 
   exit
fi

# Delete old backups 
find "$backupfolder" -mtime +$keep_day -delete