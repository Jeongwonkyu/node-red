SET PGPASSWORD=egg1412

:1

psql --host=localhost --port=55432 --username=postgres --dbname=node-red -a -f ./node-red.sql

TIMEOUT -t 5 /nobreak

GOTO 1
