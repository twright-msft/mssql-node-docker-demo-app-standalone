#run the setup script to create the DB and the schema in the DB
#change the server name, user name, and password as needed
/opt/mssql-tools/bin/sqlcmd -S sqldemo10-svc -U sa -P Seattle800 -d master -i setup.sql
