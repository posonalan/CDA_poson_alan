@echo off
SetLocal EnableDelayedExpansion
cd C:\wamp64\bin\mysql\mysql5.7.31\data
MKDIR U:\59011-07-09\-BackupBdd-\%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%
for /d %%i in (*) do (
if /I %%i NEQ performance_schema if /I %%i NEQ mysql if /I %%i NEQ sys C:\wamp64\bin\mysql\mysql5.7.31\bin --user=root --databases %%i > U:\59011-07-09\-BackupBdd-\%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%\backup_%%i_%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%.sql  
)
EndLocal