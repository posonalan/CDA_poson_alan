@echo off
SetLocal EnableDelayedExpansion
cd C:\wamp64\bin\mysql\mysql5.7.31\bin
mysql --user=root --password= agencevoyage < U:\59011-07-09\BackupBdd\20211013\backup_agencevoyage_20211013.sql 
:: mysql --user=root --password= base de donnée a upload le chemin d'accé \backup_le nom du fichier 
pause